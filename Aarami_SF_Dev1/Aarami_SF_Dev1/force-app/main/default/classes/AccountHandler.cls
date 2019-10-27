public class AccountHandler {
    public static Account insertNewAccount(string name){
        Account acc = new Account();
        acc.Name = name;
        try{
            insert acc;
        }catch(Exception e){
            return null;
           
        }
        system.debug('the inserted account name is   '+acc);
        
        return acc;
    }

}