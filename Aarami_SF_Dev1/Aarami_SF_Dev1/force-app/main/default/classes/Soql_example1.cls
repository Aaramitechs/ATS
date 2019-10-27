public class Soql_example1 {
    public list<Account> accs {get;set;}
    public Soql_example1(){
        accs=[select id,name,industry from Account];
        
    }
    public void getoffset(){
        accs=[select id,name,industry from Account offset 10];        
    }
    public void getlimit(){
        accs=[select id,name,industry from Account limit 5];
    }
    public void getAllrecords(){
        accs=[select id,name,industry from Account  ALL Rows];
    }
    public void getdeletedrecords(){
        accs=[select id,name,industry from Account where Isdeleted=true All Rows];
    }
    public void getOrderBy(){
        accs=[select id,name,industry from Account order by Name asc];
    }
    public void getDescOrder(){
        accs=[select id,name,industry from Account order by Industry DESC];
    }
    public void getPagination(){
        accs=[select id,name,industry from Account  limit 20 offset 10];
    }
}