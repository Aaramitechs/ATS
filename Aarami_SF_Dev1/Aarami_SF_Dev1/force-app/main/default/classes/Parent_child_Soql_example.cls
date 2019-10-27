public class Parent_child_Soql_example {
    public list<Account> accs {set;get;}
    
    public boolean flag1 {set;get;}
    public boolean flag2 {set;get;}
    public void stdobjct_standardlkp(){
        flag1=true;
        flag2=false;
        accs=[select Name ,industry,(select lastname,firstname from contacts) from Account];
    }
    public void stdobj_customlookup(){
        flag1=false;
        flag2=true;
                accs=[select Name ,industry,(select lastname,firstname from Customcontacts__r) from Account where industry='Energy'];

    }
    //Query child info from parent Query
    //parent===>>>child====> we should write inner query
    public void childInfo_prnt_query(){
        list<RESOURCE__C> rs_lst= new list<RESOURCE__C>();
        rs_lst=[select Name,(select Name,LECTURER_ID__c from CLASSROOMS1__r ),(select Name,STUDENT__c,subject__c from CLASSROOMS__r) from RESOURCE__c];
       system.debug('rs_lst values are===>>>  '+rs_lst);
    }

}