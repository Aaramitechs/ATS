public class First_custom_cntroller_Example {
    String FirstNAME;
    String lname;
    integer phone;
    string email;
    string companyName;
    integer income;
    string sp;
    date DOB;
       public String cntrl_msg{get; set;}
    public First_custom_cntroller_Example(){
     
        cntrl_msg='bhupathi';
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'info msg'));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Warning,'warning msg'));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'ERROR msg'));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Confirm,'Confirm msg'));
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Fatal,'Fatal msg'));
        
        this.sp=apexpages.currentPage().getparameters().get('sp');
    }
    public string getfirstName(){
        return this.firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName =firstName;
    }
    public string getlastname(){
        return this.lname;
    }
    public void setlastNAME(String LastName) {
        this.lname =LastName;
    }
    public string getc(){
        return this.companyName;
    }
    public void setc(string cmpnynme) {
        this.companyName = cmpnynme;
    }
    
    public date getDOB(){
        return this.DOB;
    }
    public void setDOB(date dob) {
        this.DOB = dob;
    }
    
    public string getE(){
        return this.Email;
    }
    public void setE(string email) {
        this.Email = email;
    }
    public integer getphone(){
        return this.phone;
    }
    public void setphone(integer mob) {
        this.phone = mob;
    }
    
    public integer geti(){
        return this.income;
    }
    public void seti(integer incme) {
        this.income = incme;
    }
        
    public PageReference Save(){
        PageReference p = Null;
        return p;
        
    }

}