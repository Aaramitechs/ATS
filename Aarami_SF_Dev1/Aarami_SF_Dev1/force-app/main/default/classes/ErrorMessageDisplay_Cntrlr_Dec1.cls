public class ErrorMessageDisplay_Cntrlr_Dec1 {
    
    public List<Account> act_ls{get; set;}
    
    public String cntrl_msg{get; set;}
    
    public ErrorMessageDisplay_Cntrlr_Dec1(){
        
        act_ls = [select id, name, accountNumber,Industry, Type from Account order by createddate desc limit 5 ];
        cntrl_msg ='Total Accont size ==>'+ act_ls.size();
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'info msg'));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Warning,'warning msg'));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'ERROR msg'));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Confirm,'Confirm msg'));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Fatal,'Fatal msg'));
    }
    

}