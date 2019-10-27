public class AggregateResults_Demo {
    
    public static void disp_StdObj_Aggrslt(){
        
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
    
    public static void disp_StdObj_Aggrslt_usng_Expr(){
        List<AggregateResult> act_ls = [select avg(AnnualRevenue),sum(AnnualRevenue),min(AnnualRevenue), max(AnnualRevenue), count(AnnualRevenue) from account];
        for(AggregateResult rs:act_ls){
            System.debug(rs.get('expr0'));
            System.debug(rs.get('expr1'));
            System.debug(rs.get('expr2'));
            System.debug(rs.get('expr3'));
            System.debug(rs.get('expr4'));
            
        }
        
    }
    
    
    public static void disp_StdObj_Aggrslt_usng_Expr_And_Alias(){
        List<AggregateResult> act_ls = [select avg(AnnualRevenue) avgact,
                                        sum(AnnualRevenue)sumAct,min(AnnualRevenue),
                                        max(AnnualRevenue)maxAct, count(AnnualRevenue) 
                                        from account];
        for(AggregateResult rs:act_ls){
            System.debug(rs.get('avgact'));
            System.debug(rs.get('sumAct'));
            System.debug(rs.get('expr0'));
            System.debug(rs.get('maxAct'));
            System.debug(rs.get('expr1'));
        }
    }
    
    
    
    /*
             String typ='Industry';
                String condit =' and Industry = \'Agriculture\' ';
             String qry = 'select count() from Account  where Type =:typ and  Closed__c = FALSE' + condit;
                System.debug('qry ==>'+qry);
        ordr_Lst_size = DataBase.countQuery(qry);
        */
    
    
    
}