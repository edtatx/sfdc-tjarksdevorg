global class LeadProcessor implements 
    Database.Batchable<sObject>, Database.Stateful {
    
    // instance member to retain state across transactions
    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, LeadSource FROM Lead'
        );
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        List<Lead> leads = new List<Lead>();
            for (Lead lds : scope) {
                lds.LeadSource = 'Dreamforce';
                // add contact to list to be updated
                leads.add(lds);
                // increment the instance member counter
                recordsProcessed = recordsProcessed + 1;
            }
        upsert leads;
    }    

    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
        String ebody = ' Records processed. Shazam!'+string.valueOf(recordsProcessed);
        String eaddress = 'ed.tjarks@gmail.com';
        String esubject = 'SFDC Batch Job Results';
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        // call some utility to send email
        //system.debug('job information: '+job);
        EmailManager.sendMail(eaddress,esubject,ebody);
    }    

}