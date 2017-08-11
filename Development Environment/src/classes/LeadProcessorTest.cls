@isTest
private class LeadProcessorTest {

    @testSetup 
    static void setup() {
        List <Lead> leads = new List<Lead>();
        // insert 200 accounts
        for (Integer i=0;i<=199;i++) {
            leads.add(new Lead(LastName='LeadTest '+i, 
                Company='SFDC', Status='Open - Not Contacted'));
        }

        upsert leads;
        List <Lead> insLeads = [SELECT Id, Name from Lead where Company='SFDC'];
        //system.debug('Leads inserted: '+insLeads);
    }

    static testmethod void test() {        
        Test.startTest();
        LeadProcessor uls = new LeadProcessor();
        Id batchId = Database.executeBatch(uls,200);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
    
}