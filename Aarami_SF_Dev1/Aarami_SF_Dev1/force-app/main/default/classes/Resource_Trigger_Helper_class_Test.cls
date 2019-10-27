@IsTest
class Resource_Trigger_Helper_class_Test {
    static testmethod void Resource_Trigger_Helper_class_Test_method(){
        Resource_Trigger_Helper_class dp = new Resource_Trigger_Helper_class();
        list< RESOURCE__c> r = new list<RESOURCE__c>();
        RESOURCE__c rs = new RESOURCE__c(Name='bhupathi rs');
        r.add(rs);
        dp.beforeinsert(r);
        dp.beforeinsertOrUpdate(r);
    }
    static testmethod void Resource_Trigger_Helper_class_Test_method_account(){
        Resource_Trigger_Helper_class acnt = new Resource_Trigger_Helper_class();
        list<Account> act = new list<Account>();
        Account acccnt = new Account(Name= 'rapaka sunil raju');
        act.add(acccnt);
        acnt.beforeinsertOrUpdate_account(act);
    }
    }