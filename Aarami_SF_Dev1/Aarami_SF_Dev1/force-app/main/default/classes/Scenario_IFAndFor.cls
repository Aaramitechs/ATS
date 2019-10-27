public class Scenario_IFAndFor {
    
    
    //Account a = new Account();
    
    public void updateIndustryonAllActs(){
        List<Account> act_ls = [select Id,name,Type, Industry from Account ];
        System.debug('act_ls count==>'+act_ls);
        
       //for(Account a: act_ls)        
                //        System.debug(a.Type);

        List<Account> act_ls_up = new List<Account>();
        
        for(Account a: act_ls){
            System.debug(a.Type);
                if(a.Type ==  'Customer - Channel')
                a.Industry ='Communications';
            else if(a.Type == 'Prospect')
                a.Industry ='Banking';
            else
            {
                if(!Test.isRunningTest())
                        a.Industry ='Government';
            }
            act_ls_up.add(a);
            //update a; // don't perform DML operations inside for loop
        }
        
        update act_ls_up;
    }
    
    
    //ScenarioIFAndFor c = new ScenarioIFAndFor();
    //c.updateIndustryonAllActs();
    
}