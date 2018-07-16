public class TokenTry{


@future(callout=true)
 public static void basicAuthCallout(){
 
Http http = new Http();

HttpRequest tokenreq = new HttpRequest();
 tokenreq.setMethod('GET');
 //tokenreq.setEndpoint('https://login.microsoftonline.com/9a1921ad-92e6-4e68-9a31-1a7cd3db48c1/oauth2/authorize');
 tokenreq.setEndpoint('https://login.microsoftonline.com/common/oauth2/authorize?response_type=id_token&client_id=2f213b68-e045-4073-9240-6742de6bfb8d&redirect_uri=https://login.salesforce.com/&response_mode=form_post&resource=https://webdir.online.lync.com&prompt=admin_consent');
HTTPResponse tokenres = http.send(tokenreq);
System.debug(tokenres);
System.debug(tokenres.getBody());
String s=tokenres.getBody();
String[] strlist=s.split('"');
Integer j;
System.debug('SIze===='+strlist.size());
for(Integer i=0;i<strlist.size();i++)
{

if(strlist[i].equals('flowToken'))
{
j=i+2;
System.debug('J==='+j);
System.debug(strlist[j]);
break;
}
}
String token1=strlist[j];
System.debug('TOKEN Coming'+token1);
String token='eyJ0eXAiOiJKV1QiLCJub25jZSI6IkFRQUJBQUFBQUFCbmZpRy1tQTZOVGFlN0NkV1c3UWZkSGljRkFhMGxfb3B2Zkctc08wRUVXR1FRSHI5V1F0X1I2UU1kTGJucDItUXJ3V0c0d043bjFMek1ieFBZNUdsWlhmcDR5emtKLUZZNEROY0lwRUEtQlNBQSIsImFsZyI6IlJTMjU2IiwieDV0IjoiejAzOXpkc0Z1aXpwQmZCVksxVG4yNVFIWU8wIiwia2lkIjoiejAzOXpkc0Z1aXpwQmZCVksxVG4yNVFIWU8wIn0.eyJhdWQiOiJodHRwczovL2dyYXBoLm1pY3Jvc29mdC5jb20iLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9lMDc5M2QzOS0wOTM5LTQ5NmQtYjEyOS0xOThlZGQ5MTZmZWIvIiwiaWF0IjoxNDkzMjI4NTg2LCJuYmYiOjE0OTMyMjg1ODYsImV4cCI6MTQ5MzIzMjQ4NiwiYWNyIjoiMSIsImFpbyI6IkFTUUEyLzhEQUFBQXZKV0o1RUJjd2VGdnZ5MzkzcElteEFqSVJmRjAzYUhGR1dDekttMWowZTQ9IiwiYW1yIjpbInB3ZCIsIm1mYSJdLCJhcHBfZGlzcGxheW5hbWUiOiJGaWxlc0V4YW1wbGUiLCJhcHBpZCI6IjU2MzA3YzUzLTc3ZWItNDc4My04OTM3LWI3ZWM4Zjk2NDIxZSIsImFwcGlkYWNyIjoiMSIsImZhbWlseV9uYW1lIjoiVGVrd2FuaSIsImdpdmVuX25hbWUiOiJKYWlraXNoYW4iLCJpcGFkZHIiOiI0NS4xMjcuMTA2LjQ2IiwibmFtZSI6IlRla3dhbmksIEphaWtpc2hhbiBSLiIsIm9pZCI6ImJkNzI4MTRlLWQ2OTAtNDFiYi1iZTdkLTcyODgwZGRhMWM3NCIsIm9ucHJlbV9zaWQiOiJTLTEtNS0yMS0zMjkwNjgxNTItMTQ1NDQ3MTE2NS0xNDE3MDAxMzMzLTQyMzIyNzQiLCJwbGF0ZiI6IjMiLCJwdWlkIjoiMTAwM0JGRkQ5MkZBMDM0NCIsInNjcCI6IkZpbGVzLlJlYWQiLCJzdWIiOiJIQ3lqVDZla2lWcDZuUW1XZEFocXZFVUdpMU1CbnVMdTVoOFdUUzVOT2RBIiwidGlkIjoiZTA3OTNkMzktMDkzOS00OTZkLWIxMjktMTk4ZWRkOTE2ZmViIiwidW5pcXVlX25hbWUiOiJqYWlraXNoYW4uci50ZWt3YW5pQGFjY2VudHVyZS5jb20iLCJ1cG4iOiJqYWlraXNoYW4uci50ZWt3YW5pQGFjY2VudHVyZS5jb20iLCJ1dGkiOiJ0RUpVVFdHR0NVaXU1R3NpM0Q4QUFBIiwidmVyIjoiMS4wIn0.eDEzZIQRNWE08Hth2om4i3d4bzeLuM6eDCqzFRp6nszhP0lulH-WQEZPqeYOoXcQqru4CSUDBIpt0k71ffh2xxbVlcCGXypc0xv91lOXSQKXig4eNJrxJi-sHGUQrhbMzVjdQ4VRfH9YJdYshwMNVlzGy5CXA6C2N5wijBmYBKo62j1Rsln0zW0sMw1iKMTOax4CMMN3EnIElEotbmZzAh2ZgTpb_Q9ZmL2o_lZRUvBRlNwZO9ycx6bH8r4gn-J3gPzMs2-IanmIaVmMrz5weAyuqIZ0bGbZjwARohANbjdzRCwdjR3KQ5lbuVYn1z_0vb-OhVN9MsDhTmY1j5IRuQ';

HttpRequest finalreq = new HttpRequest();
 finalreq.setMethod('POST');
 finalreq.setEndpoint('https://lyncweb.contoso.com/ucwa/oauth/v1/applications/103...740/onlineMeetings/myOnlineMeetings');
 
 
 finalreq.setHeader('Accept','application/json');
 finalreq.setHeader('Content-Type', 'application/json');
 finalreq.setHeader('Authorization','Bearer'+token);
 
 finalreq.setHeader('X-Ms-Origin', 'http://localhost');
 finalreq.setHeader('X-Requested-With', 'XMLHttpRequest');
 finalreq.setHeader('Referer','https://lyncweb.contoso.com/Autodiscover/XFrame/XFrame.html');
 finalreq.setHeader('Accept-Language', 'en-US');
 finalreq.setHeader('Accept-Encoding', 'gzip, deflate');
 finalreq.setHeader('User-Agent', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.2; Trident/6.0; .NET4.0E; .NET4.0C; .NET CLR 3.5.30729; .NET CLR 2.0.50727; .NET CLR 3.0.30729; InfoPath.3)');
 finalreq.setHeader('Host', 'lyncweb.contoso.com');
 //finalreq.setHeader('Content-Length', '185');
 finalreq.setHeader('DNT', '1');
 finalreq.setHeader('Connection', 'Keep-Alive');
  finalreq.setTimeout(120000);
 finalreq.setHeader('Cache-Control', 'no-cache');


String body0='{'+'\"attendanceAnnouncementsStatus\":\"Disabled\",';
String body1='\"description\":\"TEST\",';
String body2='\"subject":\"holiday party\",';
String body3= '\"attendees\": [\"sip:jaikishan.r.tekwani@accenture.com\"],';
String body4= '\"leaders\": []}';
String body=body0+body1+body2+body3+body4;
 finalreq.setBody(body);

HTTPResponse finalres=(HTTPResponse) http.send(finalreq);
System.debug(finalres.getStatus());
System.debug(finalres.getBody());


}
}