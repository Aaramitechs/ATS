/*      Class Name:  Assignment_Insert_Acct_Record.apxc
        Objects Involved: Account
        Purpose:Create a method and pass requ values to create Account rec and insert it
        Developer: DURGA PRASAD
*/
public class Assignment_Insert_Acct_Record {
    public list <Account> acc_lst =new list<Account>();
    public account aa;
    public void Method_to_insert_ONE_Record(string s,string s1,string s3){
              aa = new account(Name=s,type=s1,Accountnumber=s3);
                 insert aa;
                system.debug('Account Name is======>>>:   '+aa.Name);
       }
    public void Method_to_insert_MLTPLE_Records(string s,string s1,string s3){
        try{
            for(integer i=1;i<10;i++){
              Account a = new account();
                a.Name=s+''+i;
                a.Type=s1;
                a.AccountNumber=s3+i;
                acc_lst.add(a);
            }
            insert acc_lst;
        }catch(exception e){
            system.debug(e);
            
            
        }
        
    }
}
/*
 new Assignment_Insert_Acct_Record().Method_to_insert_Record('AMIT','Prospect','1136113677');
 
 */