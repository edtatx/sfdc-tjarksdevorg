@isTest
public class AddPrimaryContactTest {

    @isTest static void TestList()
    {
    	List<Account> acct1 = new List<Account>();
        List<Account> acct2 = new List<Account>();
        // add 5 accounts for each state
        for (Integer i = 0; i < 50; i++) {
            acct1.add(new Account(
                Name='CA Test Account'+i,BillingState='CA'
            ));
            acct2.add(new Account(name='NY Test Account'+i,BillingState='NY'));
        }
        upsert acct1;
        upsert acct2;
        Contact co = new Contact();
        co.FirstName = 'First';
        co.LastName = 'Last';
        Upsert co;

        String state = 'CA';
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(co,state);
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        	System.enqueueJob(updater);
        Test.stopTest();        
        // Validate the job ran. Check if record have correct parentId now
        System.assertEquals(50, [SELECT count() FROM Account where Id IN (SELECT AccountId from Contact) AND BillingState= :state]);
    }    
}