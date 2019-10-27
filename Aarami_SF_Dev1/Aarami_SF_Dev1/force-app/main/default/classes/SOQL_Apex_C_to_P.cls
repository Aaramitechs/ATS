public class SOQL_Apex_C_to_P {
        public static void pulling_contacts_from_Account(){
        list<contact> contcts = new list<contact>();
            
            string p = '===============>';
            contcts=[ select id,Name,Account.name,Account.phone,Owner.name,Email, Owner.email 
                     from contact] ;
            system.debug('contacts size is:'+ contcts.size());
            for(contact z: contcts){
                system.debug(p); 
            system.debug('Account name::'+z.Account.name);
            system.debug('Contact name::'+z.Name);
                
            }                   
        }
}