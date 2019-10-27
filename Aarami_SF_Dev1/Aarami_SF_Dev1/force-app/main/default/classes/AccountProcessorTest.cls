@Istest
public class AccountProcessorTest {
    static testmethod void testAccountProcessorTest(){
        Account a = new Account();
        a.Name = 'Test Account1';
        Insert a;

        Contact cont = New Contact();
        cont.FirstName ='Babbu';
        cont.LastName ='cherry';
        cont.AccountId = a.Id;
        Insert cont;
       
        list<Id> lstAccId = new list<ID>();
        lstAccId.add(a.id);
 
        Test.startTest();
            AccountProcessor.countContacts(lstAccId);
        Test.stopTest();
       
        Account ACC = [select Number_of_Contacts__c from Account where id = :a.id LIMIT 1];
        System.assertEquals ( Integer.valueOf(ACC.Number_of_Contacts__c) ,1);
    }

}