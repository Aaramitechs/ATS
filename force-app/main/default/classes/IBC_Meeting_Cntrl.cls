/**********************************************

* Class: IBC_Meeting_Cntrl
* Visualforce Page: IBC_Meeting.vfp
* Objective: This will help in inserting the meeting details and fetching the attendees information and saving it to the database
Test Class:   need to write
* Developer: Anil

**********************************************/ 
	Public class IBC_Meeting_Cntrl {
    Public IBC_Meeting__c ibc {set;get;}
    Public List<IBC_Meeting__c> attendees {set;get;}
    public Integer rowIndex		{set;get;}
    
        
        Public IBC_Meeting_Cntrl()
    {
        ibc=new IBC_Meeting__c();
        attendees=new List<IBC_Meeting__c>();
        attendees.add(new IBC_Meeting__c());
    }//EO IBC_Meeting_Cntrl constructor
        
	// This is used to add new row to the attendee block        
    Public void addRow(){
        attendees.add(new IBC_Meeting__c());   
    }// EO addRow 
    
        
	// This is used for saving the record         
    Public pagereference saveMeeting(){
        ibc=new IBC_Meeting__c();
        attendees.add(ibc);
        Insert attendees;    
        return null;
    } // EO saveMeeting
        
        
	// This is used for deleting the added row in the attendees block    
    Public PageReference deleteRow(){
        rowIndex = Integer.valueOf(ApexPages.currentPage().getParameters().get('rowIndex'));
        attendees.remove(rowIndex);
        return null;
    } // EO deleteRow
        
        
	// This helps in navigating to the home page of the object        
    Public PageReference Cancel(){
        PageReference page=new PageReference('/a03/o');
        page.setRedirect(true);
        return page;
    }  // EO Cancel
}