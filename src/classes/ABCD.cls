public class ABCD implements Schedulable{
    
    public void execute(System.SchedulableContext sc){
        SearchAndReplace sr=new SearchAndReplace('abc','try2');
         Database.executeBatch(sr);
        
    }

}