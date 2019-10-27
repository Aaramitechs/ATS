global class ScheduleApex_Demo implements Schedulable{
    
    global static void execute(SchedulableContext ctx){
        List<Account> rs_ls = [select id,name, AnnualRevenue from Account where Type = 'Other'];
        
        for(Account act:rs_ls){
            if(act.AnnualRevenue != null ){
                // send an email
                System.debug('Email sent successfully');
            }
        }
      
        getTrgrDtls( ctx);
    /*
        FutureMthod_Example_Class.futureEmpl();
        */
    }
    
    
    public static void getTrgrDtls(SchedulableContext ctx){
        CronTrigger ct = 
    [SELECT TimesTriggered, NextFireTime
    FROM CronTrigger WHERE Id = :ctx.getTriggerId()];

    }
    
    
/*  
    Programatic way of  schedule a job
    String cron_Time = '0 0 9 * * ?';
        String jobID = System.schedule('Remind Opp Owners', cron_Time, new ScheduleApex_Demo());
*/
    
}