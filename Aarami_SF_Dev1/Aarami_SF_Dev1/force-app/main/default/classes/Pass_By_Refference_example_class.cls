/*
        Class Name:  Pass_By_Refference_example_class.apxc
        Objects Involved: 
        Purpose: convey about Pass_By_Refference_example_method to display in console
        Developer: DURGA PRASAD
*/
public class Pass_By_Refference_example_class {
    public static void Pass_By_Refference_example_method(integer a,decimal b){
        decimal c;
        c=(a*b);
        system.debug('The value of c is====>>>>'+c);
    }
}
/* enter in anonymous block and excute:
integer a=10;
decimal b=25.5;
Pass_By_Refference_example_class.Pass_By_Refference_example_method(a,b);

output:
12:23:51:012 USER_DEBUG [12]|DEBUG|The value of c is====>>>>255.0
 */