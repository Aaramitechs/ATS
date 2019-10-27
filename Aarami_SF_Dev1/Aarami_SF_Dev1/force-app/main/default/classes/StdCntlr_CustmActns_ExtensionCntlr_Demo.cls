public class StdCntlr_CustmActns_ExtensionCntlr_Demo {
    RESOURCE__c rsrce;
    public StdCntlr_CustmActns_ExtensionCntlr_Demo(apexpages.StandardController stdcntlr){
        rsrce=(RESOURCE__c)stdcntlr.getRecord();
        system.debug('rsrce'+rsrce.Id);
        
    }
    
    public void custm_Actns(){
        apexpages.Message my_msg=new apexpages.Message(apexpages.Severity.CONFIRM,'Successfully saved the details');
        apexpages.addMessage(my_msg);
        apexpages.addMessage(new ApexPages.message(apexpages.Severity.ERROR,'Given Details are not Correct'));
        apexpages.addMessage(new ApexPages.message(apexpages.Severity.WARNING,'Fill All the details'));
        apexpages.addMessage(new ApexPages.message(apexpages.Severity.INFO,'Please check the Given Details Correct or not'));
        apexpages.addMessage(new ApexPages.message(apexpages.Severity.FATAL,'Given Details'));
    
        
        
        
        
    }
        
}