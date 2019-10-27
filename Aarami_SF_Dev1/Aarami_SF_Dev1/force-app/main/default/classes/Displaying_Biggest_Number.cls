public class Displaying_Biggest_Number {
   /* public static void Disp_biggest_number_method(){
    list<integer> ln_num = new list<integer>{100,101,108,204,271,364,1074,960,948,908};
        for(integer k:ln_num){
           
            system.debug('My values in the list=====>'+k);     
        }
        
        integer MaxValue = ln_num[0];

      
        system.debug('Displaying the size of the list ===>'+ln_num.size());
        system.debug('Displaying index value===>'+ln_num.get(0));
        system.debug('Displaying index value===>'+ln_num.get(1));
        system.debug('Displaying index value===>'+ln_num.get(2));
        system.debug('Displaying index value===>'+ln_num.get(3));
        system.debug('Displaying index value===>'+ln_num.get(4));
        system.debug('Displaying index value===>'+ln_num.get(5));
        system.debug('Displaying index value===>'+ln_num.get(6));
    }
*/
    public static void Display_Biggest_number(){
        list<integer> k = new list<integer>();
        k.add(100);
        k.add(205);
        k.add(345);
        k.add(212);
        k.add(4);
        k.add(9854);
        k.add(784);
        k.add(84);
        k.add(847);
        k.add(102842);
        integer maxvalue= k[0];
        integer i ;
        for(i=0;i<k.size();i++){
            if(k [i]>maxvalue)
             maxvalue = k[i];     
        }
        system.debug('The max value is====>'+maxvalue);
        system.debug('Displaying the size of the list ===>'+k.size());
    }
}