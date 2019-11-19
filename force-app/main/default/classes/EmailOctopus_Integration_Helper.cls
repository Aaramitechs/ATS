/**********************************************

*	Class: 				EmailOctopus_Integration_Helper
*	Objective: 			Helper will provide the required methods to call the actual webservice and iterate the paginations provided by Octopus
*	Test Class:  			need to write
*	Developer: 			Rajj

**********************************************/ 

public class EmailOctopus_Integration_Helper {
    
    
    // this method will process and sync with Octopus
    public static List<Octopus_Contact_Wrapper> process_Sync(Campaign cmp_prm){
        
        List<Octopus_Contact_Wrapper> disp_cnts = new List<Octopus_Contact_Wrapper>();
        Map<String,Octopus_Contact_Wrapper> ocw_mp =  new Map<String,Octopus_Contact_Wrapper>();
        String octps_cmpId = '';
        
        Campaign cmp = cmp_prm;
        String sfcmpId = cmp.Id;
        System.debug('sfcmpId ===>'+sfcmpId);
        
        try{
            
            if(cmp != null && cmp.id != null){
                octps_cmpId =  cmp.Octopus_Campaign_ID__c;
                
                System.debug('octps_cmpId===>'+octps_cmpId);
                
                String octMemSts = System.Label.Octopus_Campaign_Member_Status;
                List<String> octMemSts_ls = octMemSts.split(',');
                
                // Itereate for all status and get prepare list of wrapper
                for(String stus: octMemSts_ls){
                    stus= stus.toLowerCase().trim();
                    disp_cnts.addAll( initialize_Sync_Process(octps_cmpId,'', stus));
                }// EO for loop of all status
                System.debug('disp_cnts size from Octopus===>'+disp_cnts.size());
                
                // nov 7 for testing in page Rajj commented this
                EmailOctopus_ProcessWrapper.process_wrapper(sfcmpId, octps_cmpId, disp_cnts);
                
                updateCampaign(cmp);               
                
            }else{
                return null;
            }
            
        }catch(Exception e){
            System.debug(e.getMessage());
            // Database.rollback(sp);
        }
        
        return disp_cnts;
    }
    
    
    // this method will start htting the webservice 
    public static List<Octopus_Contact_Wrapper> initialize_Sync_Process(String octps_cmpId,String url,String stus){
        System.debug('initialize_Sync_Process invokde');
        String res_jsn_str =  EmailOctopus_Integration_Service.doGetCallout(octps_cmpId,url,stus);
        System.debug('res_jsn_str===>'+res_jsn_str);
        List<Octopus_Contact_Wrapper> disp_cnts_lcs = new  List<Octopus_Contact_Wrapper>();
        if(res_jsn_str != null && res_jsn_str.contains('"paging":[]}')){
            System.debug('No Paging');
            disp_cnts_lcs.addAll(doProcess_NoPaging(res_jsn_str,stus));
            // EO Non paging logic   
        } else if(res_jsn_str != null && res_jsn_str.contains('paging":{"next":"')){
            System.debug('with Paging');
            disp_cnts_lcs.addAll(doProcess_Paging(res_jsn_str,octps_cmpId,stus));
            // EO paging logic
        }
        
        return disp_cnts_lcs; 
        
    }// EO method initialize_Sync_Process
    
    
    // This method will process the paging json string
    public static List<Octopus_Contact_Wrapper> doProcess_Paging(String json_str,String octps_cId, String stus_lcl){
        System.debug('doProcess_Paging invokde');
        List<Octopus_Contact_Wrapper> disp_cnts_lcs = new  List<Octopus_Contact_Wrapper>();
        EmailOctopusContact_Paging_JSON2Apex emlOct_Cnt_obj = EmailOctopusContact_Paging_JSON2Apex.parse(json_str);
        List<EmailOctopusContact_Paging_JSON2Apex.Data> res_data_ls;
        
        if(emlOct_Cnt_obj != null )
            res_data_ls  = emlOct_Cnt_obj.data;
        
        if(res_data_ls != null)
            for(EmailOctopusContact_Paging_JSON2Apex.Data res_data : res_data_ls){
                EmailOctopusContact_Paging_JSON2Apex.Contact res_data_cnt =  res_data.contact;
                //System.debug('res_data_cnt ===>'+res_data_cnt);
                String res_data_occrdat_dateTime  =  res_data.occurred_at;
                //System.debug('res_data_occrdat_dateTime ===>'+res_data_occrdat_dateTime);
                
                Octopus_Contact_Wrapper dw_cnt = new Octopus_Contact_Wrapper();
                dw_cnt.FirstName = res_data_cnt.fields.FirstName;
                dw_cnt.LastName = res_data_cnt.fields.LastName;
                dw_cnt.Email = res_data_cnt.email_address;
                dw_cnt.occurred_at = res_data.occurred_at;               
                
                if(stus_lcl == 'bounced' && res_data.type != null && res_data.type != '' && res_data.type == 'HARD' )
                    dw_cnt.Status = 'Hard Bounced';
                if(stus_lcl == 'bounced' && res_data.type != null && res_data.type != '' && res_data.type == 'SOFT' )
                    dw_cnt.Status = 'Soft Bounced';
                else if(stus_lcl != 'bounced')
                    dw_cnt.Status = stus_lcl;

                System.debug('paging dw_cnt ==>'+dw_cnt);
                
                disp_cnts_lcs.add(dw_cnt);
            }
        
        String nextURL = '';
        if(emlOct_Cnt_obj.paging != null && emlOct_Cnt_obj.paging.next != null )
            nextURL =  emlOct_Cnt_obj.paging.next;
        
        if(nextURL != null && nextURL != ''){
            System.debug(nextURL);
            disp_cnts_lcs.addAll(initialize_Sync_Process(octps_cId,nextURL,stus_lcl ));
        }
        return disp_cnts_lcs;
    }
    
    
    // This method will process the no paging json string
    public static List<Octopus_Contact_Wrapper> doProcess_NoPaging(String json_str , String stus_lcl){
        System.debug('doProcess_NoPaging invokde');
        List<Octopus_Contact_Wrapper> disp_cnts_lcs = new  List<Octopus_Contact_Wrapper>();
        EmailOctopusContact_NoPaging_JSON2Apex emlOct_Cnt_obj = EmailOctopusContact_NoPaging_JSON2Apex.parse(json_str);
        List<EmailOctopusContact_NoPaging_JSON2Apex.Data> res_data_ls;
        
        if(emlOct_Cnt_obj != null )
            res_data_ls  = emlOct_Cnt_obj.data;
        
        if(res_data_ls != null)
            for(EmailOctopusContact_NoPaging_JSON2Apex.Data res_data : res_data_ls){
                
                EmailOctopusContact_NoPaging_JSON2Apex.Contact res_data_cnt =  res_data.contact;
                //System.debug('res_data_cnt ===>'+res_data_cnt);
                String res_data_occrdat_dateTime  =  res_data.occurred_at;
                //System.debug('res_data_occrdat_dateTime ===>'+res_data_occrdat_dateTime);
                
                Octopus_Contact_Wrapper dw_cnt = new Octopus_Contact_Wrapper();
                dw_cnt.FirstName = res_data_cnt.fields.FirstName;
                dw_cnt.LastName = res_data_cnt.fields.LastName;
                dw_cnt.Email = res_data_cnt.email_address;
                dw_cnt.occurred_at = res_data.occurred_at;
                
                //dw_cnt.Status = res_data_cnt.status; // commented as it is always giving the SUBSCRIED status only
                
                // res_data.type == 'HARD' || res_data.type == 'SOFT'    
                if(stus_lcl == 'bounced' && res_data.type != null && res_data.type != '' && res_data.type == 'HARD' )
                    dw_cnt.Status = 'Hard Bounced';
                if(stus_lcl == 'bounced' && res_data.type != null && res_data.type != '' && res_data.type == 'SOFT' )
                    dw_cnt.Status = 'Soft Bounced';
                else if(stus_lcl != 'bounced')
                    dw_cnt.Status = stus_lcl;
                
                 System.debug('No paging dw_cnt ==>'+dw_cnt);
                disp_cnts_lcs.add(dw_cnt);  
            }
        return disp_cnts_lcs;
    }
    
    
    
    
    
    // update Octopus_Last_Synced_Date__c in campaing with current dateTime
    public static void updateCampaign(Campaign cmp){
        try{
            
            Datetime local = convert2UserTimeZone(Datetime.now());
            cmp.Octopus_Last_Synced_Date__c = local;
            
            // Log completed activity
            logActivity(cmp,System.Label.Octopus_Activity_Completed_Status,1);
            
            update cmp;
            
        }catch(Exception e){
            System.debug(e.getMessage());
        }
    }
    
    
    // insert an activity with the respective status and assign the logged in user.
    public static void logActivity(Campaign cmp,String stus,Integer cnt){

        List<Task> ts_ls = new List<Task>();
        
        Task ts;
        for(integer i=1;i <= cnt;i++){
            String subjct  = '';
            ts = new Task();
            if(stus == System.Label.Octopus_Activity_Completed_Status)
                ts.Subject = cmp.Name + ' - synced - '+ cmp.StartDate.daysBetween( cmp.Octopus_Last_Synced_Date__c.Date()) + ' Days - @ '+cmp.Octopus_Last_Synced_Date__c;
            else if(stus == System.Label.Octopus_Activity_Initial_Status){
                ts.Subject = cmp.Name+' - '+ (i == 1 ? '24 Hrs Sync' : (i == 2 ? '48 Hrs Sync' : '72 Hrs Sync'));
                ts.ActivityDate =    cmp.StartDate.addDays(i+1);
            }
            
            ts.Status=stus;
            ts.WhatId=cmp.Id;
            ts.WhoId = [select Id,name from Contact where name =: System.Label.Octopus_Activity_Default_Contact ].Id;
            ts.OwnerId = userInfo.getUserId();
            ts_ls.add(ts);
        }

        insert ts_ls;
    }
    
    
    // this method will convert the system time to logged in user timezone
    public static dateTime convert2UserTimeZone(dateTime dtm){
        //System.debug('now==>'+now);
        Integer offset = UserInfo.getTimezone().getOffset(dtm);
        Datetime local = dtm.addSeconds(offset/1000);
        return local;
        // System.debug('local==>'+local);
    }
    
    
    // this method will return the next week day datetime if the provided datetime is weekend
    public static DateTime checkAndGetNextWeekDay(DateTime dtm){
        DateTime nextWeekDay = dtm;
        String dayOfWeek = nextWeekDay.format('E');
        if(dayOfWeek == 'Sun')
            nextWeekDay = nextWeekDay.addDays(1);
        else if(dayOfWeek == 'Sat')
            nextWeekDay = nextWeekDay.addDays(2);
        return nextWeekDay;
    }
    
    
}