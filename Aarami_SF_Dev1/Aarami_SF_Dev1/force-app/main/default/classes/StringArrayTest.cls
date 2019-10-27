public class StringArrayTest {
    public static  list<string> generateStringArray(integer n){
        List<String> myArray = new list<String> ();
        
        for(integer i=0; i<n; i++)
        {
            myArray.add('Test  '+i);
            system.debug(myArray[i]); 
       
        }
       
                     
        return myArray;   
    }


}