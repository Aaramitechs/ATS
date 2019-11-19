/**********************************************

*	Class: 				EmailOctopus_ProcessWrapper.apxc
*	Objective: 			This method will process the Wrapper & update CampaignMembers & Contacts
*	Test Class:  			need to write
*	Developer: 			Rajj

**********************************************/ 

public class EmailOctopus_ProcessWrapper {
    
    public static List<Octopus_Contact_Wrapper> process_wrapper(String sfcmpId, String octps_cmpId, List<Octopus_Contact_Wrapper> disp_cnts){
        
        System.debug('disp_cnts size from Octopus===>'+disp_cnts.size());
        Map<String,Octopus_Contact_Wrapper> ocw_mp =  new Map<String,Octopus_Contact_Wrapper>();
        Savepoint sp ;
        try{ 
            // prepared map for iteration based on email as a key
            for(Octopus_Contact_Wrapper ocw: disp_cnts){
                ocw_mp.put(ocw.Email, ocw);
            }
            
            // fetch all members based on email & sf cmpId & associated with octopus campaign id
            Set<String> cmp_mem_emil = ocw_mp.keySet();
            List<CampaignMember> cmp_mem_ls = [select Id,Email, CampaignId,ContactId, Status, Octopus_Status__c, Bounced_Date__c,
                                               Clicked_Date__c,Complained_Date__c,Opened_Date__c, Unsubscribed_Date__c //Member_Added_By__c	   
                                               from CampaignMember where Email in:cmp_mem_emil and 
                                               CampaignId=:sfcmpId  and  Campaign.Octopus_Campaign_ID__c=:octps_cmpId  ];
            System.debug('SF members size===>'+cmp_mem_ls.size());
            
            
            // CampaignMember List for for update 
            List<CampaignMember> cmp_mem_upd = new List<CampaignMember>();
            List<Contact> cnt_upd = new List<Contact>();
            
            // iterate all members whic are avaialable in SF & update them with respective values
            for(CampaignMember cmp_m :  cmp_mem_ls){
                if(ocw_mp.containsKey(cmp_m.email)){
                    Octopus_Contact_Wrapper oct_wrp = ocw_mp.get(cmp_m.email);
                    
                    Contact cnt = new Contact(Id=cmp_m.ContactId);
                    
                    cmp_m.Octopus_Status__c = oct_wrp.Status;
                    
                    if(cmp_m.Octopus_Status__c == 'Hard Bounced'){
                        cmp_m.Hard_Email_Bounce_Date__c = convertToDateTime(oct_wrp.occurred_at);
                        cnt.Email_Status__c =  'Bad Email';
                        cnt.Hard_Email_Bounce__c =  TRUE;
                    } else if(cmp_m.Octopus_Status__c == 'Soft Bounced'){
                        cmp_m.Soft_Email_Bounce_Date__c = convertToDateTime(oct_wrp.occurred_at);
                    } else if(cmp_m.Octopus_Status__c == 'Opened'){
                        cmp_m.Opened_Date__c = convertToDateTime(oct_wrp.occurred_at);
                    } else if(cmp_m.Octopus_Status__c == 'Clicked'){
                        cmp_m.Clicked_Date__c = convertToDateTime(oct_wrp.occurred_at);
                        cnt.Sync_to_Marketo__c = true;
                        cnt.Email_Status__c = 'Opt-In Mailable';
                    } else if(cmp_m.Octopus_Status__c == 'Unsubscribed'){
                        cmp_m.Unsubscribed_Date__c = convertToDateTime(oct_wrp.occurred_at);
                        cnt.HasOptedOutOfEmail =  TRUE;
                    }
                    
                    cmp_mem_upd.add(cmp_m);
                    cnt_upd.add(cnt);
                }
            }// EO for loop
            
            sp = Database.setSavepoint();
            if(cmp_mem_upd.size() > 0){
                System.debug('cmp_mem_upd.size() ==>'+cmp_mem_upd.size());
                update cmp_mem_upd;
            }
            
            if(cnt_upd.size() > 0){
                System.debug('cnt_upd.size() ==>'+cnt_upd.size());
                update cnt_upd;
            }
            
        }catch(Exception e){
            System.debug(e.getMessage());
            Database.rollback(sp);
        }
        
        return disp_cnts;
    }
    
    
    public static DateTime convertToDateTime(String src_dt){
        String str_dt = '"'+src_dt+'"';
        DateTime dt = (DateTime) JSON.deserialize(str_dt, DateTime.class);
        return dt;
    }
    
}