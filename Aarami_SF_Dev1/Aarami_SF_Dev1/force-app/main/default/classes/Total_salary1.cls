public class Total_salary1 {
    public static decimal method_salary(integer bs,integer hra,integer tax){
        decimal totalsal;
        totalsal=(bs+hra-tax);
        system.debug( totalsal);
        return totalsal;
    }

}