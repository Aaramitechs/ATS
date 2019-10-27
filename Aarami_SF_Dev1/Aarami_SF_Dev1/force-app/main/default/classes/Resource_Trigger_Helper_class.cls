public class Resource_Trigger_Helper_class{
     
    public Static boolean reso=true;
    public static Set<Id> SetOfIDs = new Set<Id>();
    
    public void beforeinsert (list<RESOURCE__c> res_new_ls){  
        
    }// start of RESOURCE__c object method
    
    public void beforeinsertOrUpdate (list<RESOURCE__c> res_new_ls){  
        /*for(RESOURCE__c res:res_new_ls){
            if(res.DOB__c==Null){
                res.DOB__c.adderror('Please fill the DOB field');
            }*/
            for(RESOURCE__c res:res_new_ls)
            if(res.STATUS__c==Null){
                res.adderror('Please fill the status field');
            }
        }   
    // End of RESOURCE__c object method
    public void afterinsert(list<RESOURCE__c> res_new_ls){ 
            
    }
    public void beforeupdate(list<RESOURCE__c> res_old_ls,list<RESOURCE__c> res_new_ls){
        
    }
    public void afterupdate(list<RESOURCE__c> res_old_ls,list<RESOURCE__c> res_new_ls){
        
    }
    public void beforedelete(list<RESOURCE__c> res_old_ls){
        
    }
        
    public void afterdelete(list<RESOURCE__c> res_old_ls){
        
    }  
    public void afterundelete(list<RESOURCE__c> res_new_ls){
           
    }  // Start of the account object method
    public void beforeinsertOrUpdate_account(list<Account> act){
        for(Account a:act)
            if(a.Industry == 'Education')
            a.adderror('We are not working for Education Orgs anymore');   
    }  // End of account object method
    
    //start of the new contact object method
    public void beforeinsertOrUpdate_cnt(list<Contact>cnt){
        for(Contact c:cnt)
if( c.Email==Null)
//c.adderror('YOU CAN NOT CREATE A RECORD WITHOUT AN EMAIL');
//else
c.adderror('YOU CAN NOT SAVE A RECORD WITHOUT AN EMAIL,PLEASE PROVIDE AN EMAIL');
    }//End of the new contact object  beforeinsertOrUpdate_cnt method
    
    //Start of the afterupdate method
    public void afterupdate_cntc(list<Contact> cnt_old_ls,list<Contact> cnt_new_ls){
        for(Contact ct :cnt_old_ls)
         for(Contact ctt :cnt_new_ls)   
            if(ct.LeadSource==Null)
            ct.adderror('lead source can not be empty');
   }
    //Start of the before insert event on the Opportunity Object
    public void BeforeInsert_Opty(list<opportunity>opty_new_lst){
        for(opportunity opty:opty_new_lst)
            if(opty.amount<=10000){
                opty.addError('Too small Opportunity');
                
            }
        }
        
        
    }