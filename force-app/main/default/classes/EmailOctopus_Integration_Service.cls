/**********************************************

*	Class: 				EmailOctopus_Integration_Service.apxc
*	Objective: 			This class method will hit Octopus REST webservice and reads the response and returns it to calling class.
*	Test Class: 		EmailOctopus_Integration_Test // need to write
*	Developer: 			Rajj
*   Testing of REST: 	EmailOctopus_Integration_Service.doGetCallout('6faf4ed7-ee2a');
                            //cmpId = '06b4694bee2a'; // test
                            //String endPointURL = 'https://emailoctopus.com/api/1.5/campaigns/'+cmpId+'/reports/'+Sts+'?api_key='+octopus_Api_key;

**********************************************/


Global class EmailOctopus_Integration_Service {

    
    
    public static String octopusCallout(String cmpId,String url,String Sts,Rest_Service_Details__mdt  rsd){
        String endPointURL = '';
        String resp_json_Str = '';
        String userName = rsd.User_Name__c;
        String password =  rsd.Password__c;
        
        EmailOctopusContact_NoPaging_JSON2Apex emlOct_Cnt_obj  = new EmailOctopusContact_NoPaging_JSON2Apex();
        
        try{
            if(url != '' && url != null)
                endPointURL = rsd.Base_URL__c +url;
            else
                endPointURL = rsd.Base_URL__c+'/api/'+rsd.Version__c+'/campaigns/'+cmpId+'/reports/'+Sts+'?api_key='+rsd.Api_key__c;
            
            System.debug('endPointURL===>'+endPointURL);
                       
            Blob headerValue = Blob.valueOf( userName + ':' +  password);  	// Specify the required user name and password to access the endpoint 
            																// As well as the header and header information 
            String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);	
            
            Httprequest request = new HttpRequest();
            Http http = new Http();
            
            request.setMethod('GET');
            request.setEndpoint(endPointURL);
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('Authorization', authorizationHeader);  // Header info with remote server user name and password
            request.setTimeout(120000); // timeout in milliseconds
            
            //request.setClientCertificateName('Sample-Rest-Self-Signed'); //Check the client certificate
            //request.setBody(jsonString);         
            
            HttpResponse response = http.send(request);   //Making call to external REST API
            
            if(response.getStatusCode() == 200){
                System.debug('The status code returned : ' + response.getStatusCode() + ' ' + response.getStatus());
                resp_json_Str = response.getBody();
            }
        }catch(Exception e){
            System.debug('Error===>'+e.getMessage());
            System.debug(e.getMessage());
        }
        return resp_json_Str;
    }
    
    
                        
    public static boolean checkCampainExistedOrNot(String cmpId){
        
        Rest_Service_Details__mdt  rsd = [select DeveloperName, MasterLabel, Api_key__c,User_Name__c, Password__c,Version__c,Base_URL__c 
                                          from  Rest_Service_Details__mdt where DeveloperName='EmailOctopus_Rest_Details'];
        System.debug('Api_key__c===>'+rsd.Api_key__c);
        
        String endPointURL = '';
        String resp_json_Str = '';
        boolean cmpExstd = true;
        
        EmailOctopusContact_NoPaging_JSON2Apex emlOct_Cnt_obj  = new EmailOctopusContact_NoPaging_JSON2Apex();
        
        try{
            endPointURL = 'https://emailoctopus.com/api/1.5/campaigns/'+cmpId+'?api_key='+rsd.Api_key__c;
            System.debug('endPointURL===>'+endPointURL);
            
            Blob headerValue = Blob.valueOf( rsd.User_Name__c + ':' +  rsd.Password__c);  	// Specify the required user name and password to access the endpoint 
            // As well as the header and header information 
            String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);	
            
            Httprequest request = new HttpRequest();
            Http http = new Http();
            
            request.setMethod('GET');
            request.setEndpoint(endPointURL);
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('Authorization', authorizationHeader);  // Header info with remote server user name and password
            request.setTimeout(120000); // timeout in milliseconds
            
            HttpResponse response = http.send(request);   //Making call to external REST API
            
            if(response.getStatusCode() == 200){
                System.debug('The status code returned : ' + response.getStatusCode() + ' ' + response.getStatus());
                resp_json_Str = response.getBody();
                 if(resp_json_Str.contains(System.Label.Octopus_Campaign_Not_found_Error))
                     cmpExstd = false;
            }
        }catch(Exception e){
            System.debug('Error===>'+e.getMessage());
           System.debug(e.getMessage());
        }
        return cmpExstd;
    }
    
    
    public static String doGetCallout(String cmpId,String url,String Sts){
         Rest_Service_Details__mdt  rsd = [select DeveloperName, MasterLabel, Api_key__c,User_Name__c, Password__c,Version__c,Base_URL__c 
                                                           from  Rest_Service_Details__mdt where DeveloperName='EmailOctopus_Rest_Details'];
        String rtrnStr = '';
        rtrnStr = octopusCallout( cmpId, url, Sts, rsd);
        return rtrnStr;
    }
    
    
}