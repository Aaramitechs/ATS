public class Class_If_Else {
    public static decimal cal_totalsal_based_on_role(integer basic_salary,string role){
        decimal result;
        decimal hra;
        decimal tax;
        try{
        if(role=='manager'){
            hra= ( basic_salary*50)/100;
            tax= ( basic_salary*10)/100;
        }
        else
            if(role=='TL'){
                hra= ( basic_salary*30)/100;
            tax= ( basic_salary*7.5)/100;
                } else
                    if(role=='Developer'){
                     hra= ( basic_salary*20)/100;
            tax= (basic_salary*5)/100;   
                    }else{
                     hra= ( basic_salary*5)/100;   
                    }
                      
        result=basic_salary+hra-tax;
        }catch(Exception e){
            system.debug(e.getMessage());
            system.debug(e.getStackTraceString());
        }
        return result;
    }

}