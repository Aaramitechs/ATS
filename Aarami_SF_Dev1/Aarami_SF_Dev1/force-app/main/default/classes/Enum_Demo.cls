/*
        Class Name:  static_method_Demo.apxc
        Objects Involved: 
        Purpose: convey about enum datatype and methods to display in console
        Developer: DURGA PRASAD
*/
public class Enum_Demo {
    public enum season {WINTER,SPRING,SUMMER,FALL}
    public enum sides {NORTH, EAST,WEST,SOUTH}
    public enum months{JAN,FEB,MAR,APRIL,MAY,JUNE,JULY,AUG,SEPT,OCT,NOV,DEC}
    PUBLIC void display_method(){
        system.debug('season=====>>>>'+season.values());
        system.debug('sides=====>>>>'+sides.values());
        system.debug('months=====>>>>'+months.values());
        system.debug('months=====>>>>'+months.mar.ordinal());
        system.debug('sides=====>>>>'+sides.west.ordinal());
        system.debug('season=====>>>>'+season.spring.ordinal());
        system.debug('season=====>>>>'+season.spring.name());
        system.debug('months=====>>>>'+months.april.name());
        system.debug('sides=====>>>>'+sides.south.name());
         }
    }
/*
 Enum_Demo cl= new Enum_Demo();
    cl.display_method();
new Enum_Demo().display_method();
 */