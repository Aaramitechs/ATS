/*      Class Name:  Future_Method_Example.apxc
        Objects Involved: 
        Purpose: Demo On future Method
        Developer: PRASAD
*/
global class FutureMethod_Demo {
    
    // annottions will give special instructions to the Processor
    @future
    public static void futureEmpl(String s){
        
        List<AggregateResult> act_ls = [select avg(AnnualRevenue) avgact,sum(AnnualRevenue)avgrvn,min(AnnualRevenue)kj, max(AnnualRevenue), count(AnnualRevenue) 
                                        from account];
        
        Integer actul = 1000000;
        // Typecast the value from Object to native Type, then only you can perform 
        // any action on the value
        Decimal avgAmount = (Decimal) act_ls[0].get('avgact');
        
        for(AggregateResult rs:act_ls){
            System.debug(rs.get('avgact'));
        }
        
        Decimal pcrn= avgAmount / actul;
        System.debug('pcrn value==>'+pcrn);
    }
    /*
        FutureMethod_Demo.futureEmpl('raja');
        */
    
}