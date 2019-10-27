public class Man extends Humanbeing{

    public Man(){
         System.debug('sub class constructor');
        super.walk();
    }
    
        public void doJob(){
                System.debug('working in some organization');
        }
        
    public override void talk(){
        System.debug('talking from Man');
    }
    
    /*
    public override void walk(){
        super.walk();
                System.debug('walking from Man');
        }
        */
}