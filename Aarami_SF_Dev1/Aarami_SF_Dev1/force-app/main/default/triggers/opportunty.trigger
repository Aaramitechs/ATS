trigger opportunty on Opportunity (before insert,after insert,before update,
                                         after update,before delete,after delete,
                                         after undelete) {
Resource_Trigger_Helper_class oppty =  new Resource_Trigger_Helper_class();
if((trigger.IsInsert |trigger.IsUpdate) && Trigger.Isbefore){
    oppty.BeforeInsert_Opty(Trigger.new);  
    }
}