@RestResource(urlMapping='/AccountInfo/*')
Global with sharing class REST_Webservice_Exps_Exmple_Nov26 {
    
       @HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Account> act_ls = [SELECT Id FROM Account WHERE Id = :accountId];
        if(act_ls != null && act_ls.size() > 0){
        	delete act_ls[0];
        }else
            System.debug('Record doen\'t existed or deleted');
        
		res.addHeader('msg', 'Record doen\'t existed or deleted');        
        
    }
    
    @HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        return result;
    }
    
    // Testing in Workbench 
    // Select Get & use below URL
    // /services/apexrest/AccountInfo/0016F00002UXVEmQAP
  ///services/data/v43.0
  
  /*
  @HttpPost
    global static String doPost(String name,String phone, String website, string ind) {
        Account account = new Account();
        account.Name = name;
        account.phone = phone;
        account.website = website;
         account.Industry = ind;
        insert account;
        return account.Name;
    }
    
     testing 
    URL: {
    "sobjects" : "/services/data/v20.0/sobjects",
    "search" : "/services/data/v20.0/search",
    "query" : "/services/data/v20.0/query",
    "recent" : "/services/data/v20.0/recent"
}
    {
    "name" : "ACT 25NOV18-1",
    "phone" : "23434500000000",
    "website" : "https://aramiservices.com"
    }
    */
    @HttpPost
    global static String doPost_Ex2(AccountInfo ai) {
        Account account = new Account();
        account.Name = ai.actName;
        account.phone = ai.ph;
        account.accountNumber = ai.actNum;
        account.Description = ai.transientString;
        
        insert account;
        return account.Id;
    }
    
    /* Select POST as a reuqest tyep 
    URL: /services/apexrest/AccountInfo
    {
    "ai" : {
                "actName" : "account Name 1",
                "ph" : "7686686",
				"actNum" : "234234234",
                "privateString" : "value for privateString"
				
            }
	}
    */
    
    

    global class AccountInfo {

        global String actName;
        global String ph;
        global String actNum { get; set; }
        private String privateString;
        global transient String transientString;
        //global static String staticString;  // will throw compilation error
    }
    
    
    
    @HttpPut
    global static ID upsertCase(String subject, String status,
        String origin, String priority, String id) {
        Case thisCase = new Case(
                Id=id,
                Subject=subject,
                Status=status,
                Origin=origin,
                Priority=priority);
        // Match case by Id, if present.
        // Otherwise, create new case.
        upsert thisCase;
        // Return the case ID.
        return thisCase.Id;
    }
    
    /* Select PUT as a reuqest tyep 
    URL: /services/apexrest/AccountInfo
    {
                "subject" : "test sub 1",
                "status" : "New",
				"origin" : "email",
                "priority" : "High"
	}
    */
    
    /*
    @HttpPatch
    global static ID updateCaseFields() {
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Case thisCase = [SELECT Id FROM Case WHERE Id = :caseId];
        // Deserialize the JSON string into name-value pairs
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        // Iterate through each parameter field and value
        for(String fieldName : params.keySet()) {
            // Set the field and value on the Case sObject
            thisCase.put(fieldName, params.get(fieldName));
        }
        update thisCase;
        return thisCase.Id;
    }   

      /* Select Patch as a reuqest tyep 
    URL: /services/apexrest/AccountInfo/5006F00001xALKDQA4
    {
                "subject" : "test sub 2",
                "status" : "Working",
                "priority" : "Medium"
	}
    */
    
    @HttpPatch
    global static ID updateCaseFields() {
        RestRequest request = RestContext.request;
        
        
        // Deserialize the JSON string into name-value pairs
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        // Iterate through each parameter field and value
        String caseId = (String)params.get('id');
            Case thisCase = [SELECT Id FROM Case WHERE Id = :caseId];
        
        for(String fieldName : params.keySet()) {
            // Set the field and value on the Case sObject
            	thisCase.put(fieldName, params.get(fieldName));
        }
        update thisCase;
        return thisCase.Id;
    }   

      /* Select Patch as a reuqest tyep 
    URL: /services/apexrest/AccountInfo/
    {			"id": "5006F00001xALKDQA4",
                "subject" : "test sub 2",
                "status" : "Working",
                "priority" : "Medium"
	}
    */
    
    

}