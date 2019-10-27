public class ExceptionHandling_Demo {
    public void ExceptionHandling_Method(){
        RESOURCE__c R = new RESOURCE__c(name='ashok kumar march251',MOBILE_NO__C='96467442');
        try{        
            insert R;
            list<string> lst= new list<string>();
            lst.add('bhupathi');
            system.debug('the values in the lst are:  '+lst.get(0));
            string k;
            boolean b= k.contains('s');
            system.debug(k.abbreviate(2));
            system.debug(k.length());
        }catch( DMLException e){
            system.debug(e.getMessage());
        }catch(listexception e){
            system.debug(e.getMessage());   
        }catch(NullpointerException e){
            system.debug(e.getMessage());   
            
        }
        catch(Exception e){
            system.debug(e.getMessage());
        }
            try{
                RESOURCE__c lst =[select id,name from RESOURCE__c where name='xyz' limit 1];    
            }catch(dmlexception e){
                system.debug(e.getmessage());
            }catch(queryexception e){
                system.debug(e.getmessage());
            }
            finally{
                system.debug('This try catch Blocks are used to run the prgram without any hults');
            }
            
        } 
    }