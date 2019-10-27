/*
        Class Name:  BatchApex_Demo.apxc
        Objects Involved: Account
        Purpose: convey about  BatchApex and Update Account values that take parameters to display in console
        Developer: DURGA PRASAD
*/


// Purpose: Update Account values
// We can use Batch Class to perform an operation for business against to bulk data

// returning Database.QueryLocator example

global class BatchApex_Demo implements Database.Batchable<sObject>{
    
    // Start method can contain List<sObject> records and it will be return the list and that list will be stored inside
    // Database.BatchableContext BC (parameter)
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        String qry = 'select id,name, AnnualRevenue from Account where Type = \'Other\'';
        //System.debug('in Start method qry==>'+qry);
        //return [select id,name, AnnualRevenue,SLAExpirationDate__c, Type from Account];
        return Database.getQueryLocator(qry);
        //Database.getquer
    }
    
    global void execute(Database.BatchableContext BC, List<Account> ac_ls){
        try{
            System.debug('ac_ls==>'+ac_ls);
            for(Account s : ac_ls){
                System.debug('in for loop 1');
                if(s.Type == 'Other'){
                    s.SLAExpirationDate__c = System.Today().addDays(10);
                }
            }      
            update ac_ls;
        }catch(Exception e){
            System.debug(e.getStackTraceString());
        }
    }
    
    global void finish(Database.BatchableContext BC){
        // for each batch this finish method will get executed
    }
    
}



/* Calling a batch
BatchApex_Demo myBatchObject = new BatchApex_Demo(); 
Id batchId = Database.executeBatch(myBatchObject,2);
system.debug('batch Id==>'+batchId);
output:15:55:16:054 USER_DEBUG [3]|DEBUG|batch Id==>7076F0000BqXgAjQQK
*/