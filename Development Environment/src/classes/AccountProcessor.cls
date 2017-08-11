Global class AccountProcessor {
    @future
    Public static void countContacts(Set<Id> accountIDs){
        buildaccountsummaries(accountIDs);
    }
    
    Private Static void buildaccountsummaries(Set<Id> accountIDs) {
        List<Account> acts = [Select Id, Name from Account];
        for (Account acct : acts) {
			integer sum = [SELECT count() FROM Contact WHERE AccountID = :acct.Id];
            acct.Number_of_Contacts__c = sum;
            update acct;
        }
    }
}