@istest
private class Assignment_Insert_Acct_Record_Test {
    @testsetup
    public static void testsetupmethod1(){
        list<account> act= new list<account>();
        for(integer i=0;i<4;i++){
            account a=new account();
            a.name='kp'+i;
            act.add(a);
        }
        insert act;
    }
    public testmethod static void Method_to_insert_ONE_Record_test(){
        test.startTest();
       new  Assignment_Insert_Acct_Record().Method_to_insert_ONE_Record('kumar','ok','zcnm');
        test.stopTest();
        
        
    }
        public testmethod static void Method_to_insert_mltple_Record_test(){
            try{
                test.startTest();
       new  Assignment_Insert_Acct_Record().Method_to_insert_MLTPLE_Records('kumar','nm','zcnm');
        test.stopTest();
        
        list<account> a= [select id,name from account];
            system.assertEquals(13, a.size());

            }catch(exception e){
                system.debug(e);
            }
            }

    
}