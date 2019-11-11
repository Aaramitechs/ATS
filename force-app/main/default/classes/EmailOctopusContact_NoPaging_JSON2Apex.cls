/**********************************************

*	Class: 		EmailOctopusContact_NoPaging_JSON2Apex
*	Objective: 	Thise Class will provide the JSON obj class when we have NO Paging URL in it
*	Test Class: EmailOctopusContact_Paging_Test
*	Developer: 	Rajj

**********************************************/ 


public class EmailOctopusContact_NoPaging_JSON2Apex {
    
    public class Fields {
		public String FirstName;
		public String LastName;
	}

	public List<Data> data;
	public List<Paging> paging;

	public class Paging {
	}

	public class Data {
		public Contact contact;
		public String occurred_at;
        public String type; // for hard bounce
	}

	public class Contact {
		public String id;
		public String email_address;
		public Fields fields;
		public String status;
		public Boolean deleted;
		public String created_at;
	}

	
	public static EmailOctopusContact_NoPaging_JSON2Apex parse(String json) {
		return (EmailOctopusContact_NoPaging_JSON2Apex) System.JSON.deserialize(json, EmailOctopusContact_NoPaging_JSON2Apex.class);
	}
}