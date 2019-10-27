public class Map_Methods_Example {
    public void Map_Methods_Examples(){
        map<string,string>mp1 = new map<string,string>();
        mp1.put('bhupathi','durga');
        mp1.put('durga','bhupathi');
        mp1.put('bhupathi','prasad');
        mp1.put('goutham','bhupathi');
        system.debug('The elements in the map are====>>>>'+mp1);
        system.debug('The keys in map are====>>>>'+mp1.keyset());
        system.debug('The values in map are====>>>>'+mp1.values());
        system.debug('size of the map in mp1 is=====>>>>'+mp1.size());
        system.debug('The value at key bhupathi is====>>>'+mp1.get('bhupathi'));
        mp1.remove('bhupathi');
        set<string> allkeys=mp1.keyset();
        for(string str:allkeys){
            system.debug('the values at key'+str+'  is   ' +mp1.get(str));
        }
        if(mp1.isempty()){
            system.debug('map has no elements =====>>>>');
        }else{
            system.debug('elements are present in map');
        }
    }
    public void Map_Methods_Examples1(){
        map<id,Account>mp2 = new map<id,Account>([select id,name from account limit 10]);
        system.debug(' the ids account are====>>>'+mp2.keyset());
        system.debug('the name of the accounts are====>>>'+mp2.values());
        for(Account acc:mp2.values()){
            system.debug('The name of the Account is  '+acc.name);
        }
    }
}