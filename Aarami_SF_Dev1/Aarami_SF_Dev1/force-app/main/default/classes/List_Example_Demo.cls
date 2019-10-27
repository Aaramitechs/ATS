public class List_Example_Demo {
    list < Account> acnt_lst = new list<Account>();
    set<string> st=new set<string>();

    public void List_methods(){
        try{
        for(integer i=1;i<5;i++){
             Account a = new Account();
            a.name='Test Account'+i;
            acnt_lst.add(a);
        }
                insert acnt_lst;

        }catch(exception e){
            system.debug(e);
        }

        }
    public void List_method2(){
      
        try{
            list<Account> acc =[select id,name from Account];
            for(Account acnt:acc){
                st.add(acnt.Name);
            }
            system.debug(st);
        }catch(exception e1){
            system.debug(e1);
                            }
    }
        }