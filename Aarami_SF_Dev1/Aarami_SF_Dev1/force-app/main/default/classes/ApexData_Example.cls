public class ApexData_Example {
    public string empName {set;get;}
    public decimal salary {set;get;}
    public integer age {set;get;}
    public ApexData_Example(){
        empName='Bhupathi durga prasad';
        salary=23050;
        age=30;
    }
    public void show(){
        system.debug('This show');
        
    }
}