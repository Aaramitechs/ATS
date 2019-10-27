public class JSON_Cntrlr_Nov29 {

    
    public list<Account> acc { get{
        //Fetch the Account List
        acc = [Select Id,Name,AccountNumber,AccountSource from Account where name != null limit 10];
        if(acc==null){
            acc = new list<Account>();
        }
        return acc;
    } set;}
    
    public string jsonSerial {get{
        //JSON Class method    
        if(acc==null){
            jsonSerial = '';
        }else{
            jsonSerial = JSON.serialize(acc);
        }
        return jsonSerial;
    } set; }
    
    
    public string jsonGen { get{
        //JSON Generator Class method 
        JSONGenerator gen = JSON.createGenerator(false);//true gives output in pretty print
        
        if(acc==null){
            return '';
        }else{
            gen.writeStartArray();
            for(Account a: acc){
                gen.writeStartObject();
                gen.writeStringField('Name', a.name);
                gen.writeStringField('Id', a.Id);
                if(a.AccountNumber==null)
                    gen.writeStringField('Account Number', '');
                else{
                    gen.writeStringField('Account Number',a.AccountNumber); 
                }
                gen.writeEndObject();
            }
            
            gen.writeEndArray();
            return gen.getAsString();
        }
    } set; } 
    
}