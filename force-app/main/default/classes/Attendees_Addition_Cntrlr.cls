/**********************************************

* Class: Attendee_Addition_Cntrlr (Attendee_Addition_Helper)
* PageName : Attendee_Addition.vfp
* Objective: Helper will provide the required methods that helps in fetching the Users attended the meeting
* Test Class:   need to write
* Developer: Anil

**********************************************/ 

	Public class Attendees_Addition_Cntrlr {
    
        Public IBC_Attendee__c attendee {set;get;}
        Public Integer rowIndex		{set;get;}
        Public List<IBC_Attendee__c> slctdAtndRecs {set;get;}
        Public Map<String, IBC_Attendee__c> slctdAtndRecs_mp {set;get;}
        Public String currentRecordId {get;set;}
        public List<IBC_Attendee__c> exstedAttndes	{set;get;}
        
        
        public Attendees_Addition_Cntrlr(ApexPages.StandardController controller) {
            currentRecordId=ApexPages.CurrentPage().getparameters().get('id');
            attendee=new IBC_Attendee__c();
            attendee.IBC_Meeting__c = currentRecordId;
            slctdAtndRecs=new List<IBC_Attendee__c>();
            fetchAttendees();
        } //EO Attendees_Addition_Cntrlr Constructor
        
        
        // This helps in fetching new attendee 
        Public void addRow(){
            slctdAtndRecs.add(attendee);
            attendee = new IBC_Attendee__c();
            attendee.IBC_Meeting__c = currentRecordId;
        }  //EO addRow
        
        // This for saving the list of attendees and navigating to the detail page of the record
        Public PageReference saveAttendees(){
            if(slctdAtndRecs.size() > 0)
                Insert slctdAtndRecs;
            PageReference pageRef = new PageReference('/'+currentRecordId);
            pageRef.setRedirect(true);
            return pageRef;
        } //EO saveAttendees
        
        //This helps in the deletion of the attendees that are fetched
        Public PageReference deleteRow(){
            rowIndex = Integer.valueOf(ApexPages.currentPage().getParameters().get('rowIndex'));
            slctdAtndRecs.remove(rowIndex);
            return null;
        } // EO deleteRow
        
        
        // This helps in navigating to the object list view page
        Public PageReference cancel(){
            PageReference page=new PageReference('/a03/o');
            page.setRedirect(true);
            return page;
        } // EO cancel
        
        
        // This helps in fetching the existing attendees for the particular meeting
        Public void fetchAttendees(){
            exstedAttndes=[select id,IBC_Attendee_Name__r.name,Polling_Response__c from IBC_Attendee__c where IBC_Meeting__c=:currentRecordId];
        } // EO fetchAttendees
	}