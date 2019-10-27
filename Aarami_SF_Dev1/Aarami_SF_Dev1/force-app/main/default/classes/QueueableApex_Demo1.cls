public class QueueableApex_Demo1 implements Queueable{
    public void execute(QueueableContext  qc){
        contact cn=new contact(lastname='bhupathi',phone='789356789');
        insert cn;
    }

}