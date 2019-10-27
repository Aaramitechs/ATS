public class ContactSearch {
    public static list<contact> searchForContacts(string ltnsme,string mpcode){
        list<contact> cntct = new list<contact>();
        cntct =  [select ID,Name FROM contact WHERE LastName=:ltnsme AND MailingPostalCode=:mpcode];
        system.debug(cntct);
        return cntct;
    }
}