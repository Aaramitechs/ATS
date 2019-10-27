public class Set_Method_Example {
    public void Set_Method_Examples(){
        //static allocation of set
        list<string>L1 =new list<string>{'raja','chinna','sunil','ramana','ramana','ramana'};
            set<string> My_set= new set<string>{'bhupathi','durga','prasad','matta','goutham'};
                system.debug('My set values are===>>>>>'+My_set);
        //Dynamic allocation of a set
        set<string> s1 = new set<string>();
        s1.addAll(L1 );
        s1.addAll(My_set);
        s1.add('ashok');
        system.debug('My set values in s1 are===>>>>>'+s1);
        boolean b= s1.contains('ashok');
        system.debug('The value in s1 is=====>'+b);
        boolean b1= s1.contains('suketh');
        system.debug('The value in s1 is=====>'+b1);
        boolean b2= s1.containsAll(L1);
        system.debug('The value in s1 is=====>'+b2);
        s1.removeAll(L1);
        system.debug('The value in s1 is=====>'+s1);
        //coverting set to list: 
        set<string>s3=new set<string>{'ramu','koti','trived','chiru','kalyan','ashok','bhupathi','dp'};
            system.debug('the values in the set s3 are=====>>>>'+s3);
        
        list<string>l2= new list<string>(s1);
        list <string>l3= new list<string>(s3);
        list<string>l4=new list<string>();
        l3.addAll(s1);
        system.debug('the values in the l3 are'+l3);
        
        l4.addAll(s3);
        system.debug('the values in the list l4 are====>>>>'+l4);
        
    }
    
}