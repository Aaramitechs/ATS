trigger Trigger_contact on Contact (before insert,before update,before delete,
                                    after insert,after update, after delete,
                                    after undelete) {
/*for(contact c:trigger.new){
if(c.email==Null)
c.addError('no Email');
}
for(contact c:Trigger.New)
if(Trigger.isInsert && c.email==Null)
c.adderror('YOU CAN NOT CREATE A RECORD WITHOUT AN EMAIL');
else
c.adderror('YOU CAN NOT SAVE A RECORD WITHOUT AN EMAIL,PLEASE PROVIDE AN EMAIL');
*/
                                        Resource_Trigger_Helper_class contct = new Resource_Trigger_Helper_class();
                                        if((trigger.isInsert | Trigger.Isupdate) && Trigger.IsBefore){
                                           contct.beforeinsertOrUpdate_cnt(Trigger.new);
                                        }
                              Resource_Trigger_Helper_class conct = new Resource_Trigger_Helper_class();
                                        if (Trigger.Isupdate && Trigger.IsAfter){
                                           conct.afterupdate_cntc(Trigger.old,Trigger.new);    
                                        }
                                            
                                        }