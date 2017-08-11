public class AccountHandler {
    
    public static Account insertNewAccount(String acctName) {
    try {
        Account acct = new Account(Name = acctName);
        insert acct;
        system.debug('An account was created with the Name: '+acct.Name);
        return acct;
    } catch (DmlException e){
        system.debug('A DML exception has occurred: '+e.getMessage());  
        return null;
        }
    }
}