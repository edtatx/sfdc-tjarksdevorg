trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<Opportunity> relatedOpps = [SELECT ID FROM Opportunity WHERE StageName = 'Closed Won'];
    
    List<Task> taskInsert = new List <Task>();
    
    For (Opportunity opp : relatedOpps) {
        taskInsert.add (new Task (Subject = 'Follow Up Test Task',WhatID=opp.ID));
    }
    insert taskInsert;
}