public class Strng_Method_Contains_Substrn {
    public Boolean contains_method(String substring){
        String myString1 = 'bhupathi';
String myString2 = 'pathi';
Boolean result =  myString1.contains(myString2);
System.assertEquals(result, true);
        return result;
    }// end of the contains_method 
    
    public Integer No_of_times_the_letter_got_repeatd_method(){
        integer result;
        String s = 'Hello This is durga prasad';
        string k= 'a';
        result = s.countMatches(k);
        system.debug('the no of times the letter A got repeatd is===>'+result);
        
        System.assertEquals(1, s.countMatches('Hello'));
        
        s = 'Hello Hello';
        System.assertEquals(2, s.countMatches('Hello'));
        
        
        s = 'Hello hello';
        System.assertEquals(1, s.countMatches('Hello'));
        s= ' Jane Jane Jane Jane Jane a a a ';
        system.assertEquals(8,s.countMatches('a'));
        
        return result;
    }//end of No_of_times_the_letter_got_repeatd_method
    
    public integer To_count_no_of_spaces_method(){
        integer i;
        string s1= 'hi this is bhupathi durga prasad from hyderabad';
        string k=' ';
        i=s1.countMatches(k);
        system.debug('the no of spaces in the string are =====>>>'+i);
        return i;
        
    }//end of the To_count_no_of_spaces_method
    public Integer pick_the_specified_location_char_to_disp_method(){
        integer k;
        string str = 'hi hellow world';
        k= str.charAt(10);
        system.debug(k);
        
        //system.assertEquals(563,str.charAt(0));
        return k;
        
    }
}