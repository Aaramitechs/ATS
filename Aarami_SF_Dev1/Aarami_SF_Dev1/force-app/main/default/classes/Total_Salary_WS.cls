public class Total_Salary_WS {
  public decimal method_salary1(integer bs,integer hra,integer tax){
        decimal totalsalary;
        totalsalary=(bs+hra-tax);
        system.debug(totalsalary);
        return totalsalary;
    }

}