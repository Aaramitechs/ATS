/*
        Class Name:  BatchApex_Demo.apxc
        Objects Involved: Account
        Purpose: convey about  BatchApex and Update Account values that take parameters to display in console
        Developer: DURGA PRASAD
*/
global class BatchApex_Method implements database.batchable<Sobject> {
    public final string query;   
    public final string S_obj;
    public final string fld;
    public final string f_Vlue;
    public BatchApex_Method(string s1,string s2, string s3,string s4){
        
        query=s1;
        S_obj=s2;
        fld=s3;
        f_vlue=s4;
        
    }
    global database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator(query);
        
    }
    global void execute(database.BatchableContext bc,List<SObject> lst){
        try{
        for(Sobject o:lst){
            o.put(fld,f_vlue);
        }
    }catch(exception e){
        system.debug('the error is:  '+e);
        
    }
    update lst;    
    }
    global void finish(database.BatchableContext bc){
        
    }
}
/*
  string s1='select name,industry from account WHERE Industry= \'Banking\'';
string s2='Account';
string s3='Industry';
string s4='Chemicals';


BatchApex_Method myBatchObject = new BatchApex_Method(s1,s2,s3,s4); 
Id batchId = Database.executeBatch(myBatchObject,1);
system.debug('batch Id==> ' +batchId);  
 */