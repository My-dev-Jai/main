@isTest
public Class Test_StateCountryController
{
static testmethod void testgetStateCountryValues(){
Country_State_Dependency__c customset2=new Country_State_Dependency__c();
        customset2.Name='2';
        customset2.Country__c='United States of America';
        customset2.State__c='Alabama';
        customset2.Country_Code__c='US';
        customset2.State_Code__c='AL';
        insert customset2; 
StateCountryController.getStateCountryValues();
}
}