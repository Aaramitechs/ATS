public class Dml_Database_Method {
    public void Database_method(){
        Account m1= new Account(Name='march2519');
        Account m2= new Account(Name='march252019');
        Account m3= new Account(Name='',type='prospect');
        database.SaveResult[] lsr=database.insert(New account[]{m1,m2,m3}, false);
        for(database.SaveResult sr:lsr){
            if(!sr.issuccess()){
                database.Error err=sr.geterrors()[0];
                system.debug('the error is:  '+err);
            }  
        }  
    } 
}
/*
 new Dml_Database_Method().Database_method();
  
 o/p:  14:44:34:225 USER_DEBUG [8]|DEBUG|the error is:  Database.Error[getFields=(Name);getMessage=Required fields are missing: [Name];getStatusCode=REQUIRED_FIELD_MISSING;] 
 */