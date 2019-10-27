public class Soql_Example2 {
    public list<opportunity> opps{set;get;}
    public Soql_Example2(){
        opps=[select name,stagename,amount,closeDate,createdDate from opportunity];
    }
    public void closedafter2015(){
        opps=[select name,stagename,amount,closeDate,createdDate from opportunity where closeDate > LAST_N_YEARS:3];
        
    }
    public void lastyear(){
        opps=[select name,stagename,amount,closeDate,createdDate from opportunity where closeDate=LAST_YEAR];
        
    }
    public void thisyear(){
        opps=[select name,stagename,amount,closeDate,createdDate from opportunity where closeDate=THIS_YEAR];
        
    }
    public void thisweek(){
        opps=[select name,stagename,amount,closeDate,createdDate from opportunity where createdDate=THIS_WEEk];
        
        
    }
    public void lastmonth(){
        opps=[select name,stagename,amount,closeDate,createdDate from opportunity where closeDate < LAST_N_MONTHS:4];
        
    }
}