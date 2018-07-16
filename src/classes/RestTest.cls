@RestResource(urlMapping='/Account/*')
global class RestTest{

    @HttpGet
    global static Account doGet(){
        
        RestRequest req=RestContext.request;
        RestResponse res=RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        System.debug('my debug from rest class+++'+accountId);
        Account result=[select id,name from account where ID=:accountId];
        return result;
        
    }


}