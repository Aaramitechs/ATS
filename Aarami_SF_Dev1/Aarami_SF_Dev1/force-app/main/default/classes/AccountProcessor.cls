public class AccountProcessor {
    @future
    public static void countContacts(list<id> lstId){
        list<Account> lstAccount = [Select id,Number_of_Contacts__c,(select id from contacts) from Account where id in:lstId];
        for(Account act:lstAccount){
            list<contact> lstcontact = act.contacts;
            act.Number_of_Contacts__c = lstcontact.size();
        }
        
        update lstAccount;
        system.debug(lstAccount);
    }

}