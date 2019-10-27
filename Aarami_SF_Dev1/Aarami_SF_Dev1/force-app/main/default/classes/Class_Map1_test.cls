@Istest
class Class_Map1_test {
    static testmethod void map_method1_test(){
        Class_Map1 mp_test = new Class_Map1();
        mp_test.map_method1();
        map<integer,string> mp2 =new map<integer,string>();
        mp_test.dismap_method1(mp2);
     
        
    }
}