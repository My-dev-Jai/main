global class myclass{
webService static string mymethod(String accname)
{
       Account a=new Account(name=accname);
       Database.SaveResult sr = Database.insert(a);
        String res=(String)sr.getId();
        return res;
}

}