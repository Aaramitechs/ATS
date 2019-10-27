public class QueueableApex_Demo implements Queueable {
    public void execute(QueueableContext context) {
        Account a = new Account(Name='Acme',Phone='(415) 555-1212');
        insert a;        
    }
}


/* Execution / or Calling Queueable execute method
 
         QueueableApex_Demo qec = new QueueableApex_Demo();
        ID jobID = System.enqueueJob(qec);
                                OR
        ID jobID = System.enqueueJob(new QueueableApex_Demo());

// find the jobs which are running in background
AsyncApexJob jobInfo = [SELECT Status,NumberOfErrors FROM AsyncApexJob WHERE Id=:jobID];

AsyncApexJob jobInfo = [SELECT Status,NumberOfErrors FROM AsyncApexJob WHERE Id=:'7076F0000BrMtxW'];
system.debug(jobInfo);
10:53:24:034 USER_DEBUG [4]|DEBUG|AsyncApexJob:{Status=Completed, NumberOfErrors=0, Id=7076F0000BrMtxWQQS}


Chaining of Quauable jobs
public class AsyncExecutionExample implements Queueable {
    public void execute(QueueableContext context) {
        // Your processing logic here       

        // Chain this job to next job by submitting the next job
        System.enqueueJob(new SecondJob());
    }
}

*/