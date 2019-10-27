trigger Trigger_Account on Account (before insert ,after insert,
                                    before update,after update,
                                    before delete, after delete,
                                    after undelete){
Resource_Trigger_Helper_class accnt = new Resource_Trigger_Helper_class();
if((trigger.isInsert | Trigger.Isupdate) && Trigger.IsBefore){
accnt.beforeinsertOrUpdate_account(Trigger.new);
                                                             }
                                        
}