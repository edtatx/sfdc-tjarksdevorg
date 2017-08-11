@isTest
private class DailyLeadProcessorTest {

    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    static testmethod void testScheduledJob() {

        // Create some Leads records
        List<Lead> Lds = new List<Lead>();
        for (Integer i=0; i<200; i++) {
            Lead l = new Lead (
                LastName = 'Lead ' + i,
                Company = 'SFDC',
                Status = 'Open - Not Contacted'
            );
            lds.add(l);
        }
        upsert lds;
        
        // Get the IDs of the opportunities we just inserted
        Map<Id, Lead> ldsMap = new Map<Id, Lead>(lds);
        List<Id> ldsIds = new List<Id>(ldsMap.keySet());

        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());         
        // Verify the scheduled job has not run yet.
        List<Task> lt = [SELECT Id 
            FROM Task 
            WHERE WhatId IN :LdsIds];
        System.assertEquals(0, lt.size(), 'Tasks exist before job has run');
        // Stopping the test will run the job synchronously
        Test.stopTest();
        
        // Now that the scheduled job has executed,
        // check that our tasks were created
        Integer j = [SELECT count() 
            FROM Lead 
            WHERE LeadSource = 'DreamForce' LIMIT 200];
        System.assertEquals(200, 
            j, 
            'Leads not updated');
        system.debug('Number of updated Leads: '+j);

    }
}