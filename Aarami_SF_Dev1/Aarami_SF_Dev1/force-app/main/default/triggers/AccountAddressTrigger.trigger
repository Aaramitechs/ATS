trigger AccountAddressTrigger on Account (before insert,before update) {
 for(Account act : Trigger.new){
        If(act.Match_Billing_Address__c == true && act.BillingPostalCode!= null){
            act.ShippingPostalCode=act.BillingPostalCode;
        }
    }

}