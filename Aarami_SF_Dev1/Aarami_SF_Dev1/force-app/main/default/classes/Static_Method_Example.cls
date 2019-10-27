public class Static_Method_Example {
   public static string sname='Trived';
    static integer age;
    public static decimal salary;
    static boolean b;
    public static void static_method(){
        sname='bhupathi';
        age=30;
        salary=25000;
        b=false;
         system.debug('sname====>>>>'+sname);
        system.debug('age====>>>>'+age);
        system.debug('salary====>>>>'+salary);
        system.debug('b====>>>>'+b);
        system.debug('sname====>>>>'+sname);
Static_Method_Example.salary=27000;
                system.debug('updated salary====>>>>'+salary);
    }
}