public class Child_Parent_Soql_example {
    public list<contact> cons {get;set;}
    public boolean flag1 {set;get;}
    public boolean flag2 {get;set;}
    public void standardobjectstdlookup(){
        flag1=true;
        flag2=false;
        cons=[select firstname,lastname,Account.name,Account.Industry from contact ];
    }
    public void customlookup(){
        flag1=false;
        flag2=true;
        cons=[select firstname,lastname,CustomAccount__r.name,CustomAccount__r.industry from contact where CustomAccount__c != ''];
    }
    //pulling the Parent info from child query
    //child===>parent
    public void parentInfo_chldQuery(){
        cons=[select id ,Name ,accountid,Account.name,Account.type,Account.industry from contact];
        system.debug('the size is====>>'+cons.size());
    }
    public void custObjct_parentInfo(){
        list<CLASSROOM__c> cr_lst =new list<CLASSROOM__c>();
        cr_lst=[select Name, subject__r.name,STUDENT__r.name,STATUS__c from CLASSROOM__c];
        system.debug('the size is'+cr_lst.size());
        
    }

}