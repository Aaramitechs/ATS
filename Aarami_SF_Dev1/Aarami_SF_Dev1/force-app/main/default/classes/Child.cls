public class Child extends parent{
    public child(integer i,string sname){
        system.debug('This is a custom Constructor');
        system.debug('The value of i is  '+i);
        system.debug('The Sname is   '+sname);
    }
    public void ChildMethod(){
      super.method1('bhpathi','prasad');

        super.method2();
    }
    public override void Method3(string k){
        system.debug('the value of k is  '+k);
        super.method3('AMIT');
    }
}
    
   /* public override method2(){
        super.method2();
        system.debug('the value of d is  ');
    }
===========================
Child mn= new Child(20,'bh');
mn.ChildMethod();

    */