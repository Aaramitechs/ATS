/**********************************************

*	Class: 		EmailOctopusContact_Paging_JSON2Apex
*	Objective: 	Thise Class will provide the JSON obj class when we have Paging URL in it
*	Test Class: EmailOctopusContact_Paging_Test
*	Developer: 	Rajj

**********************************************/ 


public class EmailOctopusContact_Paging_JSON2Apex {
    
	public List<Data> data;
	public Paging paging;

	public class Data {
		public Contact contact;
		public String occurred_at;
        public String type;
	}

	public class Contact {
		public String id;
		public String email_address;
		public Fields fields;
		public String status;
		public Boolean deleted;
		public String created_at;
	}
	
	public class Fields {
		public String FirstName;
		public String LastName;
	}

	public class Paging {
		public String next;
	}
    
	public static EmailOctopusContact_Paging_JSON2Apex parse(String json) {
		return (EmailOctopusContact_Paging_JSON2Apex) System.JSON.deserialize(json, EmailOctopusContact_Paging_JSON2Apex.class);
	}
}