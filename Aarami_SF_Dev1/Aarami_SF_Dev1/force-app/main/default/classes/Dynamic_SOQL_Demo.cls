public class Dynamic_SOQL_Demo {
    //Returns records from Sobject
    public static void SOQLmethod(string qry){
        list<Sobject> S_objt=new list<Sobject>();
        S_objt=database.query(qry);
        system.debug(S_objt.size());
        //string qry='select id,name from contact';
        //Dynamic_SOQL_Demo.SOQLmethod(qry);
        
    }
   //save mode of database 
    public static void savemethod(list<Sobject> acc){
        database.SaveResult [] drlst= database.insert(acc,false);
for(database.SaveResult sr: drlst){
    //checking records which are not success
    if(!sr.isSuccess()){
        //understanding the failed cause
        for(database.Error er:sr.getErrors() ){
            system.debug('get the errors:  '+er.getstatuscode()+'get the message'+er.getmessage());
system.debug('which field it is: '+er.getfields());            
            
        }
    }
    
}
        
    }
}
/*list<account>acc=new list<Account>{new account(name='test_ZZZZ'),new account()};
    try{
    insert acc;
    }catch(exception e){
        system.debug(e);
    } 
 */