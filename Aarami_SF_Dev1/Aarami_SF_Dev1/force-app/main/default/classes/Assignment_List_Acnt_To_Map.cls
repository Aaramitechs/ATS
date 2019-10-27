public class Assignment_List_Acnt_To_Map {
    public  list<Account> acunt = new  list<Account>();
    public  map<id,account> To_print_list_of_accounts(){
        map<id,Account> mp = new map<id,Account>([select id, name from account]);
        system.debug('the size of the map is'+mp.size());
        this.acunt =[select id, name from account];
        system.debug('the size of the  list is'+acunt.size());
        if(acunt.size()>0){
            for(Account act :  acunt )
                system.debug('list of account details'+act);     
        }
        return mp;
    }
    public  Map<id,Account> To_prnt_return_Map(){
        list<Account> lst =[select id, name from account limit 2];
        system.debug('The list of account details are==>>'+lst);
         Map<id,Account> mp_nw = new Map<id,Account>();
        mp_nw.putAll(lst);
           system.debug('The list of account details are==>>'+mp_nw);
            return mp_nw;
    }
}