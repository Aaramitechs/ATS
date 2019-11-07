public   class Case_creation {
    
    @AuraEnabled
    public static String save(Case cs)
    {
        try{
            System.debug('cs====>'+cs);
            insert cs;
        }catch(Exception e){
            system.debug('error==>'+e.getMessage());
        }
        return cs.Id;
    }
    
}