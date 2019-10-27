trigger Trigger_Resource on RESOURCE__c (before insert,after insert,before update,
                                         after update,before delete,after delete,
                                         after undelete){
    /*for(RESOURCE__c r: trigger.new)
if(r.DOB__c==Null)
r.adderror('Please fill the DOB field');
*/
    Resource_Trigger_Helper_class res_hlp_clas =  new Resource_Trigger_Helper_class();
    
    if((trigger.isInsert | Trigger.Isupdate) && Trigger.IsBefore){
        res_hlp_clas.beforeinsertOrUpdate(Trigger.new);
    }
    if(trigger.isInsert && Trigger.IsAfter){
        res_hlp_clas.Afterinsert(Trigger.new);
    }
    if (Trigger.Isupdate && Trigger.IsBefore){
        res_hlp_clas.beforeupdate(Trigger.old,Trigger.new);    
    }
    if (Trigger.Isupdate && Trigger.IsAfter){
        res_hlp_clas.Afterupdate(Trigger.old,Trigger.new);    
    }
    if(trigger.isDelete && Trigger.IsBefore){
        res_hlp_clas.beforedelete(Trigger.old);
    }
    if(trigger.isDelete && Trigger.IsAfter){
        res_hlp_clas.Afterdelete(Trigger.old);
    }
    if(trigger.isUnDelete && Trigger.IsAfter){
        res_hlp_clas.AfterUndelete(Trigger.new);
    }
}