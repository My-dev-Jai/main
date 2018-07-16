trigger ContTrigger on Contact (before insert,before update) {

   
        
        List<Id> accIDlist=new List<Id>();
        
        for(Contact con: Trigger.new){
            
           accIDlist.add(con.AccountID);
        
        }
        
        List<Contact> relatedconlist=new List<Contact>();
       relatedconlist = [select id,LeadSource,primary__c,AccountID from Contact where AccountID IN:accIDlist];
        
        if(relatedconlist!=null && !relatedconlist.isEmpty()){
         for(Contact con: Trigger.new){
             for(Contact relcon: relatedconlist){
                 
                 if(!String.isBlank(con.AccountID) && !String.isBlank(relcon.AccountID) && con.AccountID==relcon.AccountID 
                 && !String.isBlank(con.LeadSource) && !String.isBlank(relcon.LeadSource) && con.LeadSource==relcon.LeadSource
                 && relcon.primary__c==true){
                     con.addError('Only one primary contact permitted per Account per Lead Source');
                 }
                 
             }
            
         }
    }
    

}