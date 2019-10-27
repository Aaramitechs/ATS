@istest
class New_Ifelse_Method1_test {
    static testmethod void cal_totalsal_based_on_role_foremptyrl_test(){
        New_Ifelse_Method1.cal_totalsal_based_on_role_foremptyrl(5000,'');
        New_Ifelse_Method1.cal_totalsal_based_on_role_foremptyrl(75000,'manager');
        New_Ifelse_Method1.cal_totalsal_based_on_role_foremptyrl(50000,'TL');
        New_Ifelse_Method1.cal_totalsal_based_on_role_foremptyrl(5000,'Developer');
         string strng;
         New_Ifelse_Method1.cal_totalsal_based_on_role_foremptyrl(5000,strng);
      
    }
    static testmethod void cal_totalsal_based_on_role_foremptyrl_test_catch(){
        integer k;
         New_Ifelse_Method1.cal_totalsal_based_on_role_foremptyrl(k,'manager');
    }
    }