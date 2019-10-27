public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(string str){
         List<List< SObject>> leadorcntct = [FIND :str IN ALL FIELDS RETURNING Contact(FirstName,LastName) ,Lead(FirstName,Lastname)];
        system.debug(leadorcntct);
        return leadorcntct;
        
        
    }
}