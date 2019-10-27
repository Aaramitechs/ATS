/*
        Class Name:  Practice_Example1.apxc
        Objects Involved: 
        Purpose: convey about classes, variables and methods to display in console
        Developer: DURGA PRASAD
*/
public class Practice_Example1 {
    public string name='sathish';
    public integer exp=10;
    public decimal salary=20000;
    public decimal bonus;
        public static string branch;

    public void display(){
        system.debug('name'+name);
         system.debug('branch'+branch);
         system.debug('exp'+exp);
         system.debug('salary'+salary);
         system.debug('bonus'+bonus);
    }
    public void calculate(){
        if(exp>5){
            bonus=salary*0.2;
        }else{
            bonus=salary*0.1;
        }
        system.debug('bonus'+bonus);
    }
}