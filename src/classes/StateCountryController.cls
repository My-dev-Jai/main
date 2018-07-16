public class StateCountryController{

     @AuraEnabled
    public static List<Dependencies> getStateCountryValues(){
        Map<String, Country_State_Dependency__c> localDep = Country_State_Dependency__c.getAll();
        Map<String, Dependencies> returnInst = new Map<String, Dependencies>();
        if(localDep != null){
            for(Country_State_Dependency__c each: localDep.values()){
                if(returnInst.containsKey(each.Country__c)){
                    returnInst.get(each.Country__c).states.add(each.State__c);
                    returnInst.get(each.Country__c).stateCodes.add(each.State_Code__c);
                } else{
                    returnInst.put(each.Country__c, new Dependencies(each));
                }
            }
            
            Schema.DescribeFieldResult fieldResult = Address_Component__c.Country__c.getDescribe();
            for(Schema.PicklistEntry f : fieldResult.getPicklistValues()){
                if(!returnInst.containsKey(f.getLabel())){
                    returnInst.put(f.getLabel(), new Dependencies(f.getLabel(), f.getValue()));
                }
            }
            
            return returnInst.values();
        } 
        return null;
    }
    
    public class Dependencies{
        @AuraEnabled
        public String country;
        @AuraEnabled
        public String countryCode;
        @AuraEnabled
        public List<String> states;
        @AuraEnabled
        public List<String> stateCodes;
        
        public Dependencies(Country_State_Dependency__c inputInst){
            country = inputInst.Country__c;
            countryCode = inputInst.Country_Code__c;
            states = new List<String>{inputInst.State__c};
            stateCodes = new List<String>{inputInst.State_Code__c};
        }
        
        public Dependencies(String country, String countryCode){
            this.country = country;
            this.countryCode = countryCode;
            states = new List<String>();
            stateCodes = new List<String>();
        }
    }
}