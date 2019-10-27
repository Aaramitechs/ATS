public class Myclass_List {
    public  void List_method(){
        list<string> mylist = new list<string>();  
        
        mylist.add('BHUPATHI');
        mylist.add('DURGA PRASAD');
        mylist.add('MATTA');
        mylist.add('BHUPATHI');
        mylist.add('GOUTHAM');
        system.debug(mylist);    
        
    }// End of List_method 
    
    public static void list_method1(){
        list<integer> myset = new list<integer>{100,1000,10000,20,10,5,12345,789123,369258741};
        system.debug('My set size is====>  '+myset.size());    
        for(integer i: myset){
        system.debug('My set values are====>  '+i); 
 }
        integer maxvalue=  myset[0];
        integer n ;
        for(n=0;n< myset.size();n++){
        if( myset [n]>maxvalue)
        maxvalue = myset[n]; 
 }
        system.debug('The max value is====>'+maxvalue);   
    }//End of List_method1 
}