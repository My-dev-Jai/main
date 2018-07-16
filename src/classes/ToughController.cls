public class ToughController{

  /*  public String getDatalist() {
        return null;
    }

*/
    //public List<FullWrap> datalist { get; set; }

    public class ConWrap{
        
        public ConWrap(){
        b=false;
        }
    public Contact con{ get; set; }
    public Boolean b{ get; set; }
    
        public PageReference deleteCon(){
            
            if(b==true)
            delete con;
            return null;
        
        
        }
    
    }
    public class OppWrap{
        public OppWrap(){
        b=false;
        }
    public opportunity opp{ get; set; }
    public boolean b{ get; set; }
    }
    
    public class FullWrap{
    public Account a{ get; set; }
    public List<ConWrap> conlist{ get; set; }
    public List<OppWrap> opplist{ get; set; }
    public FullWrap(Account acc,List<Contact> contlist,List<opportunity> oppolist){
    a=new Account();
    a=acc;
    opplist=new List<OppWrap>();
    OppWrap opw;
    ConWrap conw;
    opplist=new List<OppWrap>();
    conlist=new List<ConWrap>();
    
    for(Opportunity oppo:oppolist){
        //opplist=new List<OppWrap>();
        opw=new OppWrap();
        opw.opp=oppo;
        opplist.add(opw);
    } 
    
    for(Contact cont:contlist){
    
    conw=new ConWrap();
    conw.con=cont;
    conlist.add(conw);
    }
    }
    }
    public List<FullWrap> datalist;
    public PageReference deleteCon(){
        PageReference pg=new ConWrap().deleteCon();
        return pg;
    }
    
    public List<FullWrap> getDatalist(){
         FullWrap fw;
         datalist=new List<FullWrap>();
        List<Account> acclist=[select id,name from Account];
        
        List<Contact> contlistAll=[select id,name,AccountID from Contact];
        List<Contact> contlist=new List<Contact>();
        
        List<Opportunity> oppolistAll=[select id,name,AccountID from Opportunity];
        List<Opportunity> oppolist=new List<Opportunity>();
        
        for(Account acc:acclist){
           for(Contact con:contlistAll){
      if(acc.ID==con.AccountID)
       contlist.add(con);
       }
       for(Opportunity opp:oppolistAll){
       if(acc.ID==opp.AccountID)
       oppolist.add(opp);
       }
           if(!contlist.isEmpty() && !oppolist.isEmpty()){
        fw=new FullWrap(acc,contlist,oppolist);
        datalist.add(fw);
        }
        }
    return datalist;
    
    }


}