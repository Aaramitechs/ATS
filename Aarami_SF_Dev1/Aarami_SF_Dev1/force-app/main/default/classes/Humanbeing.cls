public abstract class Humanbeing{
    
    public Humanbeing(){
        System.debug('Super class constructor');
    }
    
        integer legs=2;
    
        public virtual void walk(){
                System.debug('walking from Humanbeing');
        }
    
    public abstract void talk();
    
}