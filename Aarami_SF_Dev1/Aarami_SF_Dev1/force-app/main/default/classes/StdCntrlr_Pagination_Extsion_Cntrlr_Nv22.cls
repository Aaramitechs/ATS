public class StdCntrlr_Pagination_Extsion_Cntrlr_Nv22 {
    
    public integer noOfRecords ;
    public static integer PageSize{get;set;}
    ApexPages.StandardSetController custCnt_var ;
    
    public StdCntrlr_Pagination_Extsion_Cntrlr_Nv22(ApexPages.StandardSetController controller) {
        PageSize = 20;
        custCnt_var =controller;
        custCnt_var.setpagesize(PageSize);
    }
    
    //Changes the size of pagination
    public PageReference refreshPageSize() {
        custCnt_var.setPageSize(PageSize);
        return null;
    }
/*
            integer count =0;
    public PageReference incrementCounter() {
        count++;
        return null;
    }
            
    public Integer getCount() {
        return count;
    }
*/
    public static String dispValue { get; set; }
    public String prarmVal{get; set;}
    public void actionFunctionTest(){
        //if Ternary-Operator format
      prarmVal = (prarmVal == null? '':prarmVal);
      dispValue = 'Value from Action Function '+prarmVal;
    
    }
    
     public void actionFunctionType2(){
        //if Ternary-Operator format
      dispValue = 'Value from Action Function Type2';
    
    }
    
    
    
    
}