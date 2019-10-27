public abstract class Parent {
    public Parent(){
        system.debug('This is a super Constructor');
    }
    public  void Method1(string name,string initial){
        
                system.debug('Name is  ====>>>'+name);
                        system.debug('initial is  ====>>>'+initial);
     }
    public  void method2(){
        system.debug('this is another method');
    }
    public virtual void method3(string nme){
        string org=nme;
        
        system.debug('org name is  ===>>'+org);
    }
    public abstract void abs_method();


    

}