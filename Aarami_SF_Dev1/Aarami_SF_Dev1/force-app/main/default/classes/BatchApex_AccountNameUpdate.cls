Global class BatchApex_AccountNameUpdate implements database.Batchable<Sobject>{
    global database.QueryLocator start(database.BatchableContext bc){
        string qry= 'select Site from account';
        return database.getQueryLocator(qry);
    }
    global void execute(database.BatchableContext bc,list<Account> lst){
        for(account a:lst){
            a.Site=a.Site+'SFDC';
                    }
   update lst;
    }
    global void finish(database.BatchableContext bc){
        system.debug('Finish method called');
    }

}