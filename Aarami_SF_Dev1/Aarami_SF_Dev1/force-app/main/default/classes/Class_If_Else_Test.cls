@Istest
class Class_If_Else_Test {
    static testmethod void Class_If_Else_method_Test(){
        Class_If_Else.cal_totalsal_based_on_role(50000,'manager');
        Class_If_Else.cal_totalsal_based_on_role(30000,'TL');
        Class_If_Else.cal_totalsal_based_on_role(25000,'Developer');
        Class_If_Else.cal_totalsal_based_on_role(5000,'');
    }
       
}