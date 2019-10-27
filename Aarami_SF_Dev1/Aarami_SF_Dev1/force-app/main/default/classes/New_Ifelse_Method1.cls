public class New_Ifelse_Method1 {
public static decimal cal_totalsal_based_on_role_foremptyrl(integer basic_salary,string role){
        decimal result;
    decimal hra= 0;
        decimal tax = 0;
    try{
    if(role!= null && role!=''){
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
    }
    }catch(exception e){
        system.debug(e.getMessage());
        system.debug(e.getStackTraceString());

    }
    
     return result;
}
}