public class Constructor_Demo {
    public string sname;
    public integer age;
    public Constructor_Demo(){
        system.debug('Hi Hello');
    }
    public Constructor_Demo(string s){
        system.debug('Hi Hello constructor with parameters');
    }
    public void Method1(string s,integer n){
        sname=s;
        age=n;
        system.debug('The string name is===>'+sname+ '   ' +'the age is====>'+age);
        
    }
}

/*
 Constructor_Demo wc = new Constructor_Demo();
    wc.Method1('bhupathi',30);
Constructor_Demo wc1 = new Constructor_Demo();
    wc1.Method1('durga',28);
Constructor_Demo wc2 = new Constructor_Demo();
    wc2.Method1('prasad',25);
wc= new Constructor_Demo();
wc.Method1('goutham',5); 
 */