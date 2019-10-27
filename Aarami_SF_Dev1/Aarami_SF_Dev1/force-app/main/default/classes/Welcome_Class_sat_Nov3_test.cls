@istest
class Welcome_Class_sat_Nov3_test {
    static testmethod void  method_tO_assign_class_test(){
    Welcome_Class_sat_Nov3 wlc_test = new Welcome_Class_sat_Nov3();
        wlc_test.method_tO_assign_class('bhupathi');
        wlc_test.welcome_class();
        wlc_test.welcome_class('matta','goutham');
        wlc_test.welcome_class('prasad');
        
        }

}