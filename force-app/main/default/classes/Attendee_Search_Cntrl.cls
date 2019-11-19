/**********************************************

* Class: Attendee_Search_Cntrl (Attendee_Search_Helper)
* PageName : Attendee_Search.vfp
* Objective: Helper will provide the required methods that helps in fetching the Users attended the meeting
* Test Class:   need to write
* Developer: Anil

**********************************************/ 

Public class Attendee_Search_Cntrl {
    
    
    public List<User> attendees	{set;get;}
    Public List<User> fields {set;get;}
    Public List<SelectOption> left {set;get;}
    Public List<SelectOption> right {set;get;}
    public Map<String,String> notSelected {set;get;}
    public Map<String,String> selected {set;get;}
    public List<string> add {set;get;}
    public list<string> del {set;get;}
    public string searchAs {set;get;}
    public string Name	{set;get;}
    public List<User> Attended;
    public IBC_Attendee__c ibc {set;get;}
    public String currentRecordId {get;set;}
    List<IBC_Attendee__c> att	{set;get;}
    
    public String selOpt{
        get {
            if(selOpt==null)
                selOpt='Name Begins With';
            return selOpt;
        }
        set;
    }
    
    
    Public Attendee_Search_Cntrl(){
        left=new List<SelectOption>();
        right=new List<SelectOption>();
        notSelected= new Map<String,String>();
        selected= new Map<String,String>();
        add=new List<string>();
        del=new List<string>();
        fields=new List<User>();
        attended=new List<User>();
        List<IBC_Attendee__c> att=[select id,IBC_Attendee_Name__c, IBC_Meeting__c from IBC_Attendee__c where IBC_Meeting__r.Id =:currentRecordId];
    	 } // EO Attendee_Search_Cntrl constructor
    
    
    // This getOptions method helps in selecting the options from Left Picklist Area and Right Picklist Area
    Public void getOptions(){
        left.clear();
        right.clear();
        SelectOption op=new SelectOption('','');   
        for(string ky:notSelected.keySet() ){
            SelectOption opt=new SelectOption(ky,notSelected.get(ky));
            left.add(opt);
        }   
        
        for(string ky:selected.keySet()){
            SelectOption opt=new SelectOption(ky,selected.get(ky));
            right.add(opt);
        }
        
    } //EO getOptions
    
    
    // The method addEle helps in adding the selected options from Left Picklist to Right Picklist
    Public void addEle(){
        for(String ad : add){
            selected.put(ad, notselected.get(ad));
            notselected.remove(ad);
        }
        getOptions();
    } //EO addEle
    
    
    // The method remEle helps in removing the selected options from Roght Picklist back to the Left Picklist 
    Public void remEle(){
        for(String dl : del){
            notselected.put(dl, selected.get(dl));
            selected.remove(dl);
        }
        getOptions();
    } //EO remEle
    
    
    // This method getItems dynamically assigns the Radio buttons
    Public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Name Begins With','Name Begins With'));
        options.add(new SelectOption('Contains','Contains'));
        return options;
    } // EO getItems
    
    
    // The method search helps in querying and fetching Users
    Public void search(){
        string query;
        if(selOpt=='Name Begins With') {
            query=searchAs+'%';
        }     
        else if(selOpt=='Contains'){
            query = '%'+searchAs+'%';
        }
        attendees=[select id, name from User where Name Like :query];
        for(User usr:attendees){
            notSelected.put(usr.Id,usr.Name);  
            getOptions();
        } 
        
    } // EO search
    
    
    // This Save_Action method helps in saving the users that are in selected members
    Public PageReference Save_Action(){
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
        List<IBC_Attendee__c> attendeeList=new List<IBC_Attendee__c>();
        for(selectOption sopt: right){
            IBC_Attendee__c A1=new IBC_Attendee__c(); 
            A1.IBC_Attendee_Name__c=sopt.getValue();
            A1.IBC_Meeting__c=currentRecordId;
            attendeeList.add(A1);
        }
        insert(attendeeList);
        PageReference pageRef = new PageReference('/'+currentRecordId);
        pageRef.setRedirect(true);
        return pageref;
    } // EO Save_Action
   
}