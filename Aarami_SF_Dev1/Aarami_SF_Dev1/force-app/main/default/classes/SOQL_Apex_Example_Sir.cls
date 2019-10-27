public class SOQL_Apex_Example_Sir {
public static void disp_all_Acts(){
        
       List<Account> all_acts =  [select id,name,site, type, phone, Industry, AnnualRevenue 
                                  from Account where industry='Agriculture' and 
                                 Type = 'Prospect'];
        
       
        
        
        // for-each
        for(Account a: all_acts){
            if(a.industry == 'Agriculture' ){
                system.debug('Account name===>'+ a.Name);
            }
        }
        
        for(integer i=0; i < all_acts.size(); i++){
            Account a = all_acts[i];
            if(a.industry == 'Agriculture' ){
                system.debug('Account name===>'+ a.Name);
            }
        }
    }
    /*
     SOQL_Apex_Example.disp_all_Acts();
	*/
    
    
    public static void disp_Act(String act_id){
        
        List<Account> a_ls =  [select id,name,site, type, phone, Industry, AnnualRevenue 
                     from Account where id=:act_id];
           
        System.debug('Act size==>'+a_ls.size());
        if(a_ls.size() > 0){
            for(account ac: a_ls){
                if(ac.industry == 'Agriculture' ){
                    system.debug('Account name===>'+ ac.Name);
                }
            }
        }
        
    }
    
    public static void disp_AllAct_totRevenue(){
        
       List<Account> a_ls = new List<Account>();
       decimal an_tot=0; 
        
        try{

             a_ls =  [select id,name,site, type, phone, Industry, AnnualRevenue ,
                                   (select id, name, email, phone from contacts)
                                   from Account];
            
            System.debug('Act size==>'+a_ls.size());
            if(a_ls.size() > 0){
                for(account ac: a_ls){
                    if(ac.industry == 'Agriculture' ){
                        system.debug('Account name===>'+ ac.Name);
                        an_tot += ac.AnnualRevenue ;
                    }
                }
            }
        
        }catch(exception e){
            System.debug(e.getStackTraceString());
        }
        
        System.debug('an_tot ==>'+an_tot);
        
    }
    
    
    
    public static void disp_Act_vithChild_Contacts(){
        
       List<Account> a_ls = new List<Account>();
        String strs = '*******************************';
        try{
            a_ls =  [Select Id,name, AccountNumber, Owner.Name,Type, Active__c,
                     (select id, name from contacts), 
                     (select id,name from Opportunities),
                     (select id from Tasks) ,
                     (select id,subject from Cases)
                     from Account ];
            
            System.debug('Act size==>'+a_ls.size());
            if(a_ls.size() > 0){
                for(account ac: a_ls){
  						// Account Name::Test Act, Total Contacts:: 43
                        system.debug('Account name::'+ ac.Name);
                    System.debug(' Total Contacts::'+ ac.contacts.size());
                    System.debug(' Total Opportunities::'+ ac.Opportunities.size());
                    System.debug(' Total Cases::'+ ac.Cases.size());
                    System.debug(' Total Tasks::'+ ac.Tasks.size());
                    System.debug(strs);
                    
                }
                
            }
        
        }catch(exception e){
            System.debug(e.getStackTraceString());
        }
        
    }
    
    
    

}