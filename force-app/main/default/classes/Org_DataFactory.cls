@isTest
public class Org_DataFactory {
    
    //	Method to return user(profiId)
    public static User Test_User(string profiName){
        id ProfileID=[select id,name from Profile where name=:profiName].id;
        User u=new User(LastName='User', Alias='tstUser', email='test_user@ATS.org', Username='testUser@ATS.com');
        
        return u;
    }
    
    
}