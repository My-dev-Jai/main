public class TestRemoting{
public static Account tryremote(String Accname){

    Account a=[select id,name from Account where name=:Accname];
    return a;
}
}