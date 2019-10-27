public class ButtonExample2 {
    public string title {set;get;}
    public string subtitle{set;get;}
    public ButtonExample2(){
        title='student';
        subtitle='New student';
    }
    public void change(){
        title='Employee';
        subtitle='New Employee';
    }
}