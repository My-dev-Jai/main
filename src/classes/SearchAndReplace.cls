global class SearchAndReplace implements Database.Batchable<sObject>{

   global final String Query;
   global final String Entity;
   global final String Field;
   global final String Value;

   global SearchAndReplace(String q, String v){

      Query='select id,name from Account'; 
       Value=v;
   }

   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
     
   }

   global void execute(Database.BatchableContext BC, List<sObject> scope){
     for(sobject s : scope){
     Account a=(Account)s;
     a.name=Value; 
     }
     update scope;
    }

   global void finish(Database.BatchableContext BC){
   
   }
}