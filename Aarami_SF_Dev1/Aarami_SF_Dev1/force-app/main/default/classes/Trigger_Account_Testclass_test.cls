@istest 
class Trigger_Account_Testclass_test {
    static testmethod void test_account_obj(){
       Resource_Trigger_Helper_class acccnt = new Resource_Trigger_Helper_class();
        list<Account> nw = new list<Account>();
        acccnt.beforeinsertOrUpdate_account(nw);
           Account ac = new Account();
        ac.Name='Test_nov16';
        ac.Industry='Education';
        try{
            insert ac;
        } catch(exception e) {  
        }
        }
    }