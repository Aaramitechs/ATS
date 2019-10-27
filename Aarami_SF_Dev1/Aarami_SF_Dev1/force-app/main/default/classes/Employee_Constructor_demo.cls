/*
        Class Name:  Employee_Constructor_demo.apxc
        Objects Involved: 
        Purpose: convey about  default constructors & constructors that take parameters to display in console
        Developer: DURGA PRASAD
*/
public class Employee_Constructor_demo {
    string emp_name;
    integer emp_age;
    double  emp_salary;
   public Employee_Constructor_demo(){
        emp_name='bhupthi';
        emp_age=30;
        emp_salary=23050;
    }
    
    public Employee_Constructor_demo(string name,integer age,double salary){
        this.emp_name= name;
        this.emp_age=age;
        this.emp_salary=salary;
    }

    public string getemp_name(){
        return emp_name;
    }
    public integer getemp_age(){
        return emp_age;
    }
    public double getemp_salary(){
        return emp_salary;
    }
}
/*
 Employee_Constructor_demo emp1=new Employee_Constructor_demo();
Employee_Constructor_demo emp2=new Employee_Constructor_demo('prasad',28,18050);
Employee_Constructor_demo emp3=new Employee_Constructor_demo();
system.debug('the name of the Employee1 is:  '+emp1.getemp_name());
system.debug('the age of the Employee1 is:  '+emp1.getemp_age());
system.debug('the salary of the Employee1 is:  '+emp1.getemp_salary());


system.debug('the name of the Employee2 is:  '+emp2.getemp_name());
system.debug('the age of the Employee2 is:  '+emp2.getemp_age());
system.debug('the salary of the Employee2 is:  '+emp2.getemp_salary());
 
 */