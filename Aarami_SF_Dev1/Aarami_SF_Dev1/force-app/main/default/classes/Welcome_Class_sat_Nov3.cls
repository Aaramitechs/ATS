public class Welcome_Class_sat_Nov3 {
public string sname;
    public void method_tO_assign_class( string initial){
       
        system.debug('sname value====>'+initial +sname);  
    }
    // default constructors and cust.constructors
    public void welcome_class(){
        system.debug('default constructor1');
    }
    public void welcome_class(string m,string e){
          system.debug('default constructor2 initial+name=====>'+m+','+e);
    }
    public void welcome_class(string name){
    system.debug('default constructor3 name=====>'+name);
    }
        
    }