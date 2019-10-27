public class Asgmt_Palidrme_String_demo {
  /*public  static void Asgmt_Palidrme_String_demo_method( string original ){
 
string reverse = '';      
        for(Integer i = original.length() - 1; i >= 0; i--)

            {

                reverse =  reverse +original.substring(i);

            }

            if(original.equals(reverse))

            {

                System.debug('Given String is Palindrome');

            }

            else
    
            {

                System.debug('Given String is not Palindrome');

            }

        
    }
*/

   

    public void Palindrome_method(String original, String reverse) {
        { 
            for(Integer i = original.length() - 1; i >= 0; i--)
            {
                reverse =   reverse +original.substring(i, i+1);
            }
            if(original.equals(reverse))
            {
                System.debug('Given String is Palindrome');
            }
            else
            {
                System.debug('Given String is not Palindrome');
            }
        }
    }
}
/* enter in anonymous block
Asgmt_Palidrme_String_demo nw = new Asgmt_Palidrme_String_demo();
nw.Palindrome('2542','');*/