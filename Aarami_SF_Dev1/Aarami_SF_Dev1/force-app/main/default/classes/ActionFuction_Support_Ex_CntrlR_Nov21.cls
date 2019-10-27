public class ActionFuction_Support_Ex_CntrlR_Nov21{

    public static String dispValue { get; set; }
    public static String dummyString { get; set; }
    
    public String prarmVal{get; set;}
    
    Integer count = 0;
    
    public void actionFunctionTest(){
        //if Ternary-Operator format
      prarmVal = (prarmVal == null? '':prarmVal);
      dispValue = 'Value from Action Function '+prarmVal;
    
    }
    
     public void actionFunctionType2(){
        //if Ternary-Operator format
      dispValue = 'Value from Action Function Type2';
    
    }
    
    public void actionSupportTest(){
      System.debug('#### Action Support Called');
      dispValue = 'Value from Action Support '+dummyString;
    }
    
            
    public PageReference incrementCounter() {
        count++;
        return null;
    }
            
    public Integer getCount() {
        return count;
    }
}