trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    list<Task> tasklisttoinsert = new list<Task>();
    for(opportunity opp: Trigger.New){
        if(opp.StageName == 'Closed Won'){
            Task t = new Task();
            t.subject = 'Follow Up Test Task';
            t.WhatId =  opp.Id; 
            tasklisttoinsert.add(t);
        }
    }
    if (tasklisttoinsert.size()>0){
        insert tasklisttoinsert;
    }
}