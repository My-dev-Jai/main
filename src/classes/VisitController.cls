public class VisitController{

    private final POC__c poc; 
    public boolean b{get; set{b=false;}}
    public VisitController(ApexPages.StandardController controller) {   
      controller.addfields(new List<String>{'Visits__c'});
      this.poc= (POC__c)controller.getRecord();
      //b=false;
      
    }
    public void increamentor(){
        
        poc.visits__c= poc.visits__c+1;
        System.debug('aaaa====>>>'+poc.visits__c);
        b=true;
        update poc;
    
    }

}