/**********************************************

* Class: Case_Creation_Cntrlr 
* PageName : Case Creation.vfp.vfp
* Objective: Helps in inserting a new case
* Test Class:   need to write
* Developer: Anil

**********************************************/ 
	Public class Case_Creation_Cntrlr {
    
        Public List<Schema.RecordTypeInfo> RT 	{set;get;}
        Public Case cs	{set;get;}
        public String currentRecordId {get;set;}
        
        // Constructor
        Public Case_Creation_Cntrlr(ApexPages.StandardController controller){
           cs=new Case();
        }//EO Constructor
        
        
        // This helps in inserting a new case into the case object and navigates to the detailed record of the inserted cases
        Public PageReference insertCase(){
      		cs.RecordTypeId=Schema.SObjectType.Case.getRecordTypeInfosByName().get('Retail').getRecordTypeId();
                insert cs;
            PageReference casePage = new ApexPages.StandardController(cs).view();
            casePage.setRedirect(true);
            return casePage;
          } // EO insertCase
}