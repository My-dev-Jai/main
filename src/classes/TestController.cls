public class TestController
{
    public TestController(){}
   public TestController(ApexPages.StandardController controller){
   showtable =false;
selaccount='NONE';
    this.controller =controller;
   }
    ApexPages.Standardcontroller controller {get; set;}
    public PageReference editacc()
    {
        return controller.edit();
    }
public String selaccount{get; set;}
public boolean showtable {get; set;}
//public List<account> accounts;
public list<contact> contacts{get; set;}
public List<SelectOption> getAccounts(){
 List<SelectOption> options=new List<SelectOption>();
 options.add(new SelectOption('NONE','NONE'));

for(Account a:[select id,name from Account])
{
if(a!=null && a.name!=null){
System.debug(a);
options.add(new SelectOption(a.ID,a.Name));
}
}
return options;
}

public PageReference setupContacts()
{contacts=new List<Contact>();
//showtable=true;
if(selaccount!=null)
contacts=[select id,name from Contact where AccountID=:selaccount];

if(contacts!=null && !contacts.isEmpty())
showtable=true;
else
showtable=false;
System.debug(contacts);
return null;

}
}