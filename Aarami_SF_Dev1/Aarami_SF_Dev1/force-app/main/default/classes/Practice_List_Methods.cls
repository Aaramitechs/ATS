public class Practice_List_Methods {
    public static void Practice_List_Method(){
        // Create a list using integer data type
List<Integer> ls1 = new List<Integer>();
// Add two integers to the list
ls1.add(1);
ls1.add(2);
ls1.add(23);
system.debug(ls1);
 // Create a list using string data type  
 List<string> ls2= new list<string>();
    // Add two strings to the list    
     ls2.add('bhupathi');
        ls2.add('durga prasad');
        system.debug('the list of strings are===>>'+ls2);
        list<integer>ls3 =new list<integer>(ls1);
        system.debug(ls3);
        //List<T>(setToCopy)
        set<string>sl = new set<string>();
        sl.add('Matta');
          sl.add('Goutham');
          sl.add('vinay');
          sl.add('das');
          sl.add('Matta');
          sl.add('Gopi');
        // Create a list based on a set
list<string> ls = new list<string>(sl);
        // ls elements are copied from sl

System.debug(ls);
        
    }

}