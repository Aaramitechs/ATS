public class Example_March1 {
    public string title {set;get;}
    public string name {set;get;}
    public string selected {set;get;}
    public void submit(){
        if(selected=='hyd'){
            title=name+': You have selected:hyd';
        }else{
            title=name+':You have selected  :'+''+selected;
        }
        
    }
}