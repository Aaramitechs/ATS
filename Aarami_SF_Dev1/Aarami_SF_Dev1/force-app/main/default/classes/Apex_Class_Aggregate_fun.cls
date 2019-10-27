public class Apex_Class_Aggregate_fun {
    public static void using_aggregate_fun(){
        decimal total=Null;
        list<Opportunity> opp_ls = new list<Opportunity>();
        try{
            opp_ls =[select id,Name,Amount from Opportunity ];
            system.debug('Opportunity size is::'+opp_ls.size());   
        }catch(Exception e){
             System.debug(e.getMessage());
            System.debug(e.getStackTraceString());
        }
    }
}