/*trigger HelloWorldTrigger on Account (before insert,before update,before delete,after insert,after update,after delete,after undelete){
system.debug('HelloWorld!');
}*/
trigger MyTriggerBulk on Account(before insert) {
    for(Account a : Trigger.New){
    a.Description = 'New description';
    }
}