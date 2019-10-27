/*
        Class Name:  PassByValue_Demo.apxc
        Objects Involved: 
        Purpose: convey about Pass by value and methods to display in console
        Developer: DURGA PRASAD
*/


public class PassByValue_Demo {
    public void pass_by_value_method(string sname,integer i,decimal k,boolean f){
        system.debug('sname is===>>>>'+sname);
        system.debug('i value is===>>>>'+i);
        system.debug('k value is===>>>>'+k);
        system.debug('f is===>>>>'+f); 
    }

}
/* enter in anonymous block and excute:
 new PassByValue_Demo().pass_by_value_method('bhupathi',908,1414400,true);


o/p:11:37:26:020 USER_DEBUG [3]|DEBUG|sname is===>>>>bhupathi
11:37:26:020 USER_DEBUG [4]|DEBUG|i value is===>>>>908
11:37:26:020 USER_DEBUG [5]|DEBUG|k value is===>>>>1414400
11:37:26:020 USER_DEBUG [6]|DEBUG|f is===>>>>true
  
 */