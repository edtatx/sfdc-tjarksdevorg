@isTest(seeAllData = true)
private class AccountProcessorTest {
    @isTest static void TestAccountUpdate(){
        Test.startTest();
        List<Account> accountstoupdate = new List<account>();
		Map<Id,Account> accountmap = New Map<Id,Account>(accountstoupdate);
		AccountProcessor.countContacts(accountmap.keySet());
        Test.stopTest();
    }
}