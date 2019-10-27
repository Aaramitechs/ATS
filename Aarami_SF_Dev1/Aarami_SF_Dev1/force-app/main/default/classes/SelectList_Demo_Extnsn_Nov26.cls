public class SelectList_Demo_Extnsn_Nov26 {
 
    public integer noOfRecords ;
    public static integer pageSize{get;set;}
    ApexPages.StandardSetController custCnt_var ;
    
    public SelectList_Demo_Extnsn_Nov26(ApexPages.StandardSetController controller) {
        pageSize = 40;
        custCnt_var =controller;
        custCnt_var.setpagesize(pageSize);
        
        size=10;
        setPageSizeOptions();
       // controller.getrecords();
    }
    
    //Changes the size of pagination
    public PageReference refreshPageSize() {
        custCnt_var.setPageSize(pageSize);
        return null;
    }
    
    public PageReference refreshPageSize_AF(){
        setCon.setPageSize(size);
        return null;
    }
    
    
    
    
    
    Public Integer size{get;set;} 
    Public Integer totRecSize{get; set;} 
    public List<SelectOption> paginationSizeOptions{get;set;}
         

     
    public void setPageSizeOptions(){
        paginationSizeOptions = new List<SelectOption>();
        paginationSizeOptions.add(new SelectOption('5','size 5'));
        paginationSizeOptions.add(new SelectOption('10','size 10'));
        paginationSizeOptions.add(new SelectOption('20','size 20'));
        paginationSizeOptions.add(new SelectOption('50','size 50'));
        paginationSizeOptions.add(new SelectOption('100','size 100'));
    }
    
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {                
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select id,Subject,CaseNumber,Origin,ClosedDate,Account.name,LastModifiedDate  from Case]));
                setCon.setPageSize(size);  
                totRecSize = setCon.getResultSize();
            }            
            return setCon;
        }
        set;
    }
     

 
    // Initialize setCon and return a list of record    
     
    public List<Case> getCustCaseRecs() {
         return (List<Case>) setCon.getRecords();
    }
    
}