/*
	ClassName: CustCntrlr_CustAction_Page_Cntrlr
	Related VFP: CustCntrlr_CustAction_Page
	Test Class: CustCntrlr_CustAction_Page_Cntrlr_Test
 */ 

public class CustCntrlr_CustAction_Page_Cntrlr_Nov21 {
	
    public String name{get; set;}
     Date DOB;
    public Integer AnlRev{get; set;}
    
    public CustCntrlr_CustAction_Page_Cntrlr_Nov21(){
        if(Reg == null){
            Reg = new Registration__c();
        }
    }
    
    public date getDOB(){
        return this.DOB;
    }
    public void setDOB(date dob) {
        this.DOB = dob;
    }
    
    public Registration__c Reg{get;set; }
    
    public PageReference saveRegRec(){
        System.debug('name==>'+name);
        Registration__c rg = new Registration__c();
        rg.Name=name;
        rg.ANNUAL_INCOME__c  = AnlRev;
        insert rg;
        //DML_operations_Example_Class.insert_Std_Obj_rec(actNm,'Low');
        return ApexPages.currentPage();
    }
    
}