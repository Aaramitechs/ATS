/*
        Class Name:  Practice_Getter_setter_methods_Example.apxc
        Objects Involved: 
        Purpose: convey about private access modifiers & Getter_setter_methods_Example to display in console
        Developer: DURGA PRASAD
*/
public class Practice_Getter_setter_methods_Example {
    string Modelnumber;
    integer NumberInstock;
    boolean isold;
    public Practice_Getter_setter_methods_Example(){
Modelnumber='Samsung00908';
    NumberInstock=489;
    isold=false;
    }
    public void setModelNumber(string Themodelnumber){
       this.Modelnumber=Themodelnumber;
    }
    public string getModelNumber(){
        return Modelnumber;
    }
    public void setold(boolean old){
       this.isold=old;
    }
    public boolean getold(){
        return isold;
    }
    public void setNumberInstock(integer numberInstock){
        this.NumberInstock=numberInstock;
    }
    public integer getNumberInstock(){
        return NumberInstock;
    }


}
/* 
 Practice_Getter_setter_methods_Example vc = new Practice_Getter_setter_methods_Example();
vc.setModelNumber('11042019');
system.debug('The ModelNumberis    '+vc.getModelNumber()); 

Practice_Getter_setter_methods_Example vc = new Practice_Getter_setter_methods_Example();
Practice_Getter_setter_methods_Example cv = new Practice_Getter_setter_methods_Example();
Practice_Getter_setter_methods_Example cc = new Practice_Getter_setter_methods_Example();

vc.setModelNumber('11042019');
vc.setNumberInstock(200);
system.debug('The ModelNumber is:    '+vc.getModelNumber());
system.debug('The NumberInstock is:   '+vc.getNumberInstock());
system.debug('It  is old one:   '+vc.getold());

system.debug('The ModelNumber is:    '+cv.getModelNumber());
system.debug('The NumberInstock is:   '+cv.getNumberInstock());
system.debug('It  is old one:   '+cv.getold());

system.debug('The ModelNumber is:    '+cc.getModelNumber());
system.debug('The NumberInstock is:   '+cc.getNumberInstock());
system.debug('It  is old one:   '+cc.getold());
 
 */