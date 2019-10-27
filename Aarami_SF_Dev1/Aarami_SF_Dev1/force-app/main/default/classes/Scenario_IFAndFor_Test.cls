@isTest
private class Scenario_IFAndFor_Test {
    
    @testSetup
    public static void testSetupAct(){
        Account a; 
        for(integer i=0; i<=10;i++){
            a = null;
            a = new Account(Name='Name'+i, AccountNumber = 'Actnum'+i);
            if(i==2)
                a.Type = 'Customer - Channel';
            if(i==3)
                a.Type = 'Prospect';
            
            insert a;
        }
        
    }
    
    
    // Our Test Code will not pick the Actual data 
    public testmethod static void AccoutsCnt0_test(){
        Scenario_IFAndFor c = new Scenario_IFAndFor();
        c.updateIndustryonAllActs();
    }
    
    // We have to create our own record inside test class (TestData or MockData)
    @isTest
    public static void AccoutsCnt2_test(){
        
        Scenario_IFAndFor c = new Scenario_IFAndFor();
        c.updateIndustryonAllActs();
    }
    
    
    // We have to create our own record inside test class (TestData or MockDate)
    @isTest
    public static void Accouts_VthTypeVal_test(){
        
        Test.startTest(); 
        Scenario_IFAndFor c = new Scenario_IFAndFor();
        c.updateIndustryonAllActs();
        Test.stopTest();
        List<Account> test_act = [select Id from Account where Industry ='Government'];
        System.assertEquals(0, test_act.size());
        
        
    }
    
    
}