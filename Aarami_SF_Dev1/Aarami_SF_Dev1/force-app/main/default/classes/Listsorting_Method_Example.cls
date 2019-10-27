public class Listsorting_Method_Example {
    public void Listsorting_Method(){
        List<String> colors = new List<String>{'Yellow','Green','Red','pink'};
            colors.sort();
        System.assertEquals('Green', colors.get(0));
        System.assertEquals('Red', colors.get(1));
        System.assertEquals('Yellow', colors.get(2));   
        system.assertEquals('pink', colors.get(3));
        system.debug(colors);
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('A','United States'));
        options.add(new SelectOption('C','Canada'));
        options.add(new SelectOption('A','Mexico'));
        System.debug('Before sorting: ' + options);
        options.sort();
        System.debug('After sorting: ' + options);
        String[]dp= new String[0];
        dp.add('bhupathi');
        
        List<Integer> myList = new List<Integer>();
myList.add(47);
Integer myNumber = myList.get(0);
system.assertEquals(47, myNumber);
        system.debug('dp'+myList);
        List<Integer> myList1 = new Integer[6];
myList.add(0, 47);
myList.add(1, 52);
system.assertEquals(52, myList.get(1));
        
         system.debug('dp'+myList1);
    }
    public void setcontains_Method(){
        Set<String> myStringSet = new Set<String>();
        myStringSet.add('Durga');
        
        // Defines a new set with two elements
        Set<String> set1 = new Set<String>{'New York', 'Paris'};
            
            
            // Define a new set
            Set<Integer> mySet = new Set<Integer>();
        // Add two elements to the set
        mySet.add(1);
        mySet.add(3);
        mySet.add(5);
        mySet.add(7);
        mySet.add(11);
        mySet.add(13);
        // Assert that the set contains the integer value we added
        System.assert(mySet.contains(13)); 
        system.assert(mySet.contains(5));  
        // Remove the integer value from the set
        mySet.remove(1); 
        mySet.remove(7);         
        
        
        // Define a new set that contains the
        // elements of the set created in the previous example
        Set<Integer> mySet2 = new Set<Integer>(mySet);
        // Assert that the set size equals 1
        // Note: The set from the previous example contains only one value
        System.assert(mySet2.size() == 4);
        system.debug(mySet2);
        
    }
}