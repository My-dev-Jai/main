trigger TestTrigger on Account (before Insert) {
//CallOut c=new CallOut();
//CallOut.basicAuthCallout();
TokenTry.basicAuthCallout();
}