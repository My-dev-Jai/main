public class CallOut {


@future(callout=true)
 public static void basicAuthCallout(){
 
 /*
 HttpRequest tokenreq = new HttpRequest();
 tokenreq.setMethod('GET');
 tokenreq.setEndpoint('https://contoso.com/WebTicket/oauthtoken');
 String username = 'jaikishan.r.tekwani@accenture.com';
 String password = 'saijiwat_singh57';

 Blob headerValue = Blob.valueOf(username + ':' + password);
 String authorizationHeader = 'BASIC ' +
 EncodingUtil.base64Encode(headerValue);
 tokenreq.setHeader('Authorization', authorizationHeader);
 HTTPResponse tokenres = http.send(tokenreq);
 
  System.debug('Response===>>'+tokenres.getBody());
 System.debug('Response===>>'+tokenres.getstatus());
 */
 
 HttpRequest req = new HttpRequest();
 req.setEndpoint('https://api.skypeforbusiness.com/platformservice/discover');
 req.setMethod('GET');

 // Specify the required user name and password to access the endpoint 

 // As well as the header and header information 


 //String username = 'tekwani_jai@yahoo.com';
// String password = 'jiwatsingh';

 //Blob headerValue = Blob.valueOf(username + ':' + password);
 //String authorizationHeader = 'BASIC ' +
 //EncodingUtil.base64Encode(headerValue);
// req.setHeader('Authorization', authorizationHeader);

 // Create a new http object to send the request object 

 // A response object is generated as a result of the request   


 Http http = new Http();
 HTTPResponse res = http.send(req);
 System.debug('Response===>>'+res.getBody());
 System.debug('Response===>>'+res.getstatus());
 String jsonStr = res.getBody();
 String[] strlist=jsonStr.split('"');
    System.debug('List==='+strlist);   
    Integer k; 
 for(Integer i=0;i<strlist.size();i++){
 if(strlist[i].equals('myOnlineMeetings')){
 k=i+4;
 }
 
 }
 String url2=strlist[k];
 HttpRequest tokenreq = new HttpRequest();
 tokenreq.setMethod('GET');
 //tokenreq.setEndpoint('https://login.microsoftonline.com/9a1921ad-92e6-4e68-9a31-1a7cd3db48c1/oauth2/authorize');
 tokenreq.setEndpoint('https://login.microsoftonline.com/common/oauth2/authorize?response_type=id_token&client_id=e7f1ed70-3709-4570-84fa-c37d7a8ad4ce&redirect_uri=https://login.salesforce.com/&response_mode=form_post&resource=https://webdir.online.lync.com&prompt=admin_consent');
HTTPResponse tokenres = http.send(tokenreq);
System.debug(tokenres);
System.debug(tokenres.getBody());
String s=tokenres.getBody();
String[] strlist2=s.split('"');
Integer j;
System.debug('SIze===='+strlist2.size());
for(Integer i=0;i<strlist2.size();i++)
{

if(strlist2[i].equals('flowToken'))
{
j=i+2;
System.debug('J==='+j);
System.debug(strlist2[j]);
break;
}
}
String token=strlist2[j];
 System.debug('url2'+url2);
 HttpRequest req2 = new HttpRequest();
 req2.setEndpoint(url2);
 req2.setMethod('GET');
  req2.setHeader('Authorization','Bearer cwt='+token);
  //Http http = new Http();
 HTTPResponse res2 = http.send(req2);
 System.debug('Response2===>>'+res2.getBody());
 System.debug('Response2===>>'+res2.getstatus());
 
 
 
  }
 
 }