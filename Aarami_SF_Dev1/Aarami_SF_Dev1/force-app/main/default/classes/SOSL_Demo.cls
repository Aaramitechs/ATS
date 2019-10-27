public class SOSL_Demo {
    public void Demo_SOSL(){
        list<list<Sobject>>searchlist=[find 'test*' in all fields returning Account(id,name),contact(name,phone),opportunity(name),RESOURCE__c(name),CLASSROOM__c(name)];
            system.debug('The size of the searchlist is:   '+searchlist.size()); 

        list<Account>Acc_list=((list<Account>)searchlist[0]);
        system.debug('The size of the Accounts is:   '+Acc_list.size()); 
        contact[] con_list=((list<contact>)Searchlist[1]);
        system.debug('The size of the contacts is:   '+con_list.size()); 
        opportunity[] opp_list=((list<opportunity>)searchlist[2]);
        system.debug('The size of the opportunities is:   '+opp_list.size());
        RESOURCE__c[] rs_list=((list<RESOURCE__c>)searchlist[3]);
        system.debug('The size of the RESOURCE__c is:   '+rs_list.size()); 
        CLASSROOM__c[] cr_list=((list<CLASSROOM__c>)searchlist[4]);
        system.debug('The size of the CLASSROOM__c is:   '+cr_list.size()); 
  
    }
    
}