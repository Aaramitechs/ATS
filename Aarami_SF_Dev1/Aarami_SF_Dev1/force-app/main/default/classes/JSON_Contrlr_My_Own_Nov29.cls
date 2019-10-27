public class JSON_Contrlr_My_Own_Nov29 {
    
    public list<RESOURCE__c> resrce { get{
         //Fetch the RESOURCE__c List
        resrce = [select Id,Name,RESOURCE_TYPE__c,PARENT__r.Name from RESOURCE__c where name!= null  and RESOURCE_TYPE__c = 'student'  limit 5];
        if(resrce==null){
            resrce = new list<RESOURCE__c>();
        }
            return resrce;
    }    set; }
    
    
     public string jsonSerial {get{
        //JSON Class method    
        if(resrce==null){
            jsonSerial = '';
        }else{
            jsonSerial = JSON.serialize(resrce);
        }
        return jsonSerial;
    } set; }
  /*  
   public string  JsonGen { Get{
          //JSON Generator Class method 
         JSONGenerator gen = JSON.createGenerator(false); 
        //true gives output in pretty print
               if(resrce==null){
            return '';
               }else{
                   gen.writeStartArray();
                   for(RESOURCE__c res: resrce){
                       gen.writeStartObject();
                       gen.writeStringField(Name, res.Name);
                       gen.writeStringField(Id, res.Id);
                   }
               }
         return gen.getAsString();

    }
         set; }
*/

}