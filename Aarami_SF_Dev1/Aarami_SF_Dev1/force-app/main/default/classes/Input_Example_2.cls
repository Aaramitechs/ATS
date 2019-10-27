public class Input_Example_2 {
    public integer Aval {set;get;}
    public integer Bval {set;get;}
    public integer Cval {set;get;}
    public void Submit(){
        Cval=Aval+Bval;
    }
    public void Reset(){
        Aval=Null;
        Bval=Null;
        Cval=Null;
    }
}