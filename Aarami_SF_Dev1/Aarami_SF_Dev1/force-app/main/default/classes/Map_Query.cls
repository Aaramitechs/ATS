/*
 Purpose:To query Sobject by using Map collection
 
 */



public class Map_Query {
    map<id,Account> acc_mp=new map<id,Account>([select id,name from account]);
    public void Method_query(){
system.debug('acc_mp is===>>>'+acc_mp.size());
system.debug('acc_mp keys are====>>>>'+acc_mp.keyset());
system.debug('acc_mp keys are====>>>>'+acc_mp.values());
    }




}