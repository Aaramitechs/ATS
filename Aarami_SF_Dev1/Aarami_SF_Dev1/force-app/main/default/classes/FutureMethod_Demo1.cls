/*
        Class Name:  Future_Method_Example.apxc
        Objects Involved:list<Account> 
        Purpose: Demo On future Method
        Developer: PRASAD
*/
Global class FutureMethod_Demo1 {
    @future
    public Static void method1(list<id>actlst){
        list<account> act= new list<account>();
        act=[select name from account where id IN :actlst];
        for(Account a: act){
            a.Name='Uday Bhaskar';
        }
        update act;
        system.debug(act);
    }

}
/*list<id> lst=new list<id>();
    lst.add('0016F00003DGble');
FutureMethod_Demo1.method1(lst);
18:46:30:031 USER_DEBUG [6]|DEBUG|(Account:{Name=AcmeSFDC, Id=0016F00003DGbleQAD})
  
 */