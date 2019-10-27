public class StdCntrlr_CustActions_Extension_Nov21 {
    private final Registration__c rgs;
    private ApexPages.StandardController standard_cntler;
    public StdCntrlr_CustActions_Extension_Nov21(ApexPages.StandardController standard) {
        System.debug('StdCntrlr_CustActions_Extension_Nov21 constructor');
        this.standard_cntler = standard;
        this.rgs = (Registration__c)standard_cntler.getRecord();
    }
    public String getGreeting() {
        return 'Hello User from StdCntrlr_CustActions_Extension ';
    }
    public PageReference UpdateRec_Redirect(){
        return standard_cntler.save();
    }
    
}