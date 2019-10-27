public class Myclass_Map {
    public static map<integer,string> mp1= new map<integer,string>();
    public static void map_method1(){
        mp1.put(1, 'USA');
        mp1.put(2, 'UK');
        mp1.put(3, 'UAE');
        mp1.put(4, 'US');
        mp1.put(5, 'IND');
        mp1.put(6, 'PAK');
        mp1.put(7, 'usa');
        
        system.debug('the size of the mp1 is'+mp1.size());
        system.debug('the keys of the map are'+mp1.keySet());
        system.debug('the values of the map are'+mp1.values());
        system.debug(mp1);
        system.debug('the value in the key 6 is'+mp1.get(6));
        mp1.remove(5);
        mp1.clear();
        
        mp1.put(25,'bhupathi');
        set<integer> new_set = mp1.keySet();
        for(integer i:new_set){
            system.debug('The value at key  '+ i+'  is '+mp1.get(i)); 
            
        }
    }
    
    public static void dismap_method1(map<integer,string> mp){
        system.debug(mp);
    }
    public static  map<id,Account> map_method2(){
        map<id,Account> new_map = new map<id,Account>([select id, Name from Account limit 5]);
        system.debug('the size of the map is  ===>>'+new_map.size());
        system.debug('My key values in map are===>>'+new_map.keyset());
        system.debug('My values in map are===>>'+new_map.values());
        for(Account acc:new_map.values())
            system.debug('The name of the Account is  ===>>'+acc.Name);
        return new_map;
    }
}