@istest
private class List_Example_Demo_Test {
    @testsetup
    public static void testsetup_method(){
           list<account> lst_acc= new list<account>();

        for(integer i=0;i<2;i++){
            
        Account a =new account();
        a.Name='bhupathi'+i;
lst_acc.add(a);
   
        }
        insert lst_acc;
    }
    public testmethod static void List_methods_test(){
        test.startTest();
      List_Example_Demo lst=  new List_Example_Demo();
        lst.List_methods();
        lst.List_method2();
        test.stopTest();
         list<account> act=[select id,name from account where name='bhupathi0'];
    system.assertEquals(1, act.size());

        
    }
 
}