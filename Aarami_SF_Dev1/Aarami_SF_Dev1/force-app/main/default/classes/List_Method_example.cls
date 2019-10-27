public class List_Method_example {
    public void List_Method_examples(){
        list<integer> one = new list<integer>{40,50,60};
            list<integer> two =new list<integer>{70,80,90,100,200,300,400,500};
        one.add(20);
        one.add(30);
        one.addall(two);
        system.debug('elements in the list are'+one);
        one.sort();
                system.debug('The list after sorting>>>>>>'+one);
       one= two.clone();
                system.debug('display list after cloning>>>>>>'+one);
        
    }
    public void Assign_values_List(){
        list<string> l1= new list<string>();
        list<string>l2 = new list<string>{'pavan','durga','ashok'};
            list<string>l3= new list<string>();
        string s;
        string s1;
        l1.add('bhupathi');
        l1.add('prasd');
        l1.add('matta');
        l1.add('goutham');
        l1.add('vinay');
        l1.addall(l2);
        l1.add(s);
        l1.add(s1);
        l1.set(3,'kumar');
        l1.add(3,'kumari');
        system.debug('The elements in the list are'+l1);
        system.debug('The size of the list'+l1.size());
        system.debug('Display the list index at 0 is=====>'+l1.get(0));
        system.debug('Display the list index at 1 is=====>'+l1.get(1));
        system.debug('Display the list index at 2 is=====>'+l1.get(2));
        system.debug('Display the list index at 3 is=====>'+l1.get(3));
        system.debug('Display the list index at 5 is=====>'+l1.get(5));
        l3.addall(l1);
        system.debug('The complete list in l3 is'+l3);
        system.debug('The size of the list'+l3.size());
        system.debug('The size of the list'+l2.size());
        system.debug('The size of the list'+l2.remove(2));
        system.debug('The size of the list'+l2.size());
        system.debug('The size of the list'+l2.clone());
        l1.sort();
        system.debug('The list after sorting'+l1);
        l1.remove(0);
        l1.remove(1);
        l1.remove(3);
        l1.remove(5);
        system.debug('The list after removing'+l1);
                system.debug('The list size after removing'+l1.size());
        l2.clear();
                system.debug('The list size'+l2.size());




    }
    
}