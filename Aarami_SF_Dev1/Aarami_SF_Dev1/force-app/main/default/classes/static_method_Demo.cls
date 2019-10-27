/*
        Class Name:  static_method_Demo.apxc
        Objects Involved: 
        Purpose: convey about classes, static variables and methods to display in console
        Developer: DURGA PRASAD
*/
public class static_method_Demo{
    public date dob= date.today();
    public void method1(){
            system.debug('Static_Method_Example.sname====>>>'+Static_Method_Example.sname);      
        Static_Method_Example.sname ='BHUPATHI DURGA PRASAD';    
        Static_Method_Example.salary =35000;
        system.debug('sname====>>>>'+Static_Method_Example.sname);
        system.debug('salary====>>>>'+Static_Method_Example.salary);
        system.debug('dob====>>>>'+dob);
        
    }
}

/*
 Excute in Anonymous block:
new static_method_Demo().method1();
Static_Method_Example.sname='Ashok kumar';
system.debug('sname====>>>>'+Static_Method_Example.sname);
 */