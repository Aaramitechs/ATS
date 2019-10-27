public class Example_Sobject_Data {
    public Account acc {set;get;}
    public contact con {set;get;}
    public  Example_Sobject_Data(){
        acc=new Account();
        con=new contact();
    }

}