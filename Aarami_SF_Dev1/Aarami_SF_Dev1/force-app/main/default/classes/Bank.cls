/*
        Class Name:  Bank.apxc
        Objects Involved: 
        Purpose: convey about classes, instance variables and methods to display in console
        Developer: DURGA PRASAD
*/
public class Bank {
    public string accno;
    public decimal balance=25000;
    public void deposit(decimal amount){
        balance=balance+amount;
        system.debug('Balance====>>>'+balance);
    }
    public void withdraw(decimal amt){
        balance=balance-amt;
        system.debug('Balance====>>>'+balance);
   
    }
}
/*
 Bank bk= new bank();
bk.deposit(75000);
bk.withdraw(25000); 
output:11:12:00:004 USER_DEBUG [14]|DEBUG|Balance====>>>100000
11:12:00:004 USER_DEBUG [18]|DEBUG|Balance====>>>75000

Another way Excuting the method:
Bank bk= new bank();
bk.deposit(75000);
New bank().withdraw(10000);
output:output:11:13:42:016 USER_DEBUG [14]|DEBUG|Balance====>>>100000
11:13:42:016 USER_DEBUG [18]|DEBUG|Balance====>>>15000

 */