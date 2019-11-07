@isTest
public class Test_Attendees_Addition_Cntrlr {
    @isTest static void addRow_Test(){
        IBC_Attendee__c test_Attendee=new IBC_Attendee__c();
        
        test_Attendee.IBC_Attendee_Name__c='0052v00000ebgEPAAY';
        test_Attendee.Polling_Response__c='Excused';
	      test_Attendee.IBC_Meeting__c='a032v00003Ei1ujAAB';
 	         insert test_Attendee;
   
     integer i=[select count() from IBC_Attendee__c where IBC_Attendee_Name__c=:test_Attendee.IBC_Attendee_Name__c and Polling_Response__c=:test_Attendee.Polling_Response__c];
    	system.assertEquals(i, 1);	
    }
      
	}