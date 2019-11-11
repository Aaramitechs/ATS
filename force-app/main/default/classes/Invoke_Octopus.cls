/**********************************************

*	Class: 				Invoke_Octopus.apxc
*	Objective: 			Helper will provide the required methods to call the actual webservice and iterate the paginations provided by Octopus
*	Test Class:  			need to write
*	Developer: 			Rajj

**********************************************/ 

public class Invoke_Octopus {
    
    
    // updated name from getCampaignDtls to doSync_Ltng
    @AuraEnabled
    public static String doSync_Ltng(Id cmpId){
        String rtrnStr = 'Valid';
        try{
            
            String logiinUsrProfNm = [select id,name from Profile where id=: UserInfo.getProfileId()].Name;
             Campaign cmp = [select Id,Octopus_Campaign_ID__c,Name, Status,StartDate,EndDate,IsActive from Campaign  where id =: cmpId ] ;
            
            
            if( !(System.Label.Octopus_Sync_Permitted_Profiles.contains(logiinUsrProfNm))){
                rtrnStr = 'Error: Profile Restricted';
            }else if(cmp.Status != System.Label.Campaign_InProgress_Status || cmp.Octopus_Campaign_ID__c == null  || cmp.Octopus_Campaign_ID__c == ''
                     ||  cmp.StartDate > System.TODAY()  || 	cmp.EndDate < System.TODAY() || !cmp.IsActive ){
                         rtrnStr = 'Error: Please review Sync with Octopus rules and recheck values';
                     }else{
                         
                         if(! EmailOctopus_Integration_Service.checkCampainExistedOrNot(cmpId) ){
                             rtrnStr = 'Error: '+System.Label.Campaign_Not_Found_Error_Msg;
                         } else{
                             Datetime str_tim = system.now();
                             System.debug('Process start time==>'+str_tim);
                             EmailOctopus_Integration_Helper.process_Sync(cmp);
                             Datetime end_tim = system.now();
                             System.debug('Process end time==>'+end_tim);
                             System.debug('Process time laps ==>'+ ( end_tim.millisecondGmt() - str_tim.millisecondGmt()) +' milliseconds ');
                         }
                     }

        }catch(Exception e){
            rtrnStr = 'Error: '+e.getMessage();
        }
        return rtrnStr;
    }
    
    
    
    @InvocableMethod(label='Invoke_Octopus_Create3TaskForCmpNotification' description='This method will create 2 tasks for first time 24,48,72 hrs')
    public static void createTask(List<Id> cmpIds) {
        try{
            Campaign cmp = [select Id,Name,Status,Octopus_Campaign_ID__c,Octopus_Automation_Status__c, StartDate, IsActive, 
                            Octopus_Last_Synced_Date__c, Octopus_Next_Sync_Start_Date__c,Octopus_Next_Sync_End_Date__c 
                            from Campaign
                            where id =: cmpIds[0]  
                            //and Status =: System.Label.Campaign_InProgress_Status -- 7Nov Rajj commented per kiran thought 
                            // StartDate <= TODAY // removed this condition for future campaigns
                            // AND ( NOT StartDate < TODAY)
                            AND  EndDate >= TODAY  
                            AND Octopus_Campaign_ID__c != null 
                           	AND IsActive = TRUE ] ;
            
            EmailOctopus_Integration_Helper.logActivity(cmp,System.Label.Octopus_Activity_Initial_Status,3);
            
        }catch(Exception e){
            System.debug(e.getMessage());
        }
    }
    
    
    
}