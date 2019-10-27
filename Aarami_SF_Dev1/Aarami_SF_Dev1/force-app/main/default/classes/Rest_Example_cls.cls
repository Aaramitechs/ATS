@RestResource(urlMapping='/showcontactinfo/*')
global class Rest_Example_cls {
    @HttpGet
    global static List<Contact> Getcnct(){
        List<Contact> cnct;
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
         cnct = [SELECT Id, Name,Department,Phone FROM Contact];
        return cnct;
    }
     /*
    @HttpPost
    global static String doPost(String mob,String dept, String email,string Name) {
        Contact cnt = new Contact();
        cnt.Phone = mob;
        cnt.Department = dept;
        cnt.Email = email;
        cnt.LastName =Name;
        insert cnt;
        return cnt.Id;
    }
   
     TEST URL:/services/apexrest/showcontactinfo/
{
    "Name" : "Test-NOv27-18",
    "email" : "bhupathi@gmail.com",
    "dept" : "test_dept",
    "mob" : "789123456"
}
    */
    
    global class contactInfo {

        global String cnctName;
        global String mob;
         global String email;
        global String dept { get; set; }
        private String privateString;
        global transient String transientString;
        //global static String staticString;  // will throw compilation error
    }
    
    @HttpPost
    global static String doPost_Ex2(contactInfo ai) {
       Contact cnt = new Contact();
        cnt.LastName = ai.cnctName;
        cnt.phone = ai.mob;
        cnt.Department = ai.dept;
        cnt.Email = ai.email;
        
        insert cnt;
        return cnt.Id;
    }
    
    /* Select POST as a reuqest tyep 
    URL: /services/apexrest/AccountInfo
    {
    "ai" : 
{
"cntName" : "Test-NOv27-18-2",
    "email" : "goutham@gmail.com",
    "dept" : "test_dept1",
    "mob" : "789123456"
            }
	}
    */
    
    

    

}