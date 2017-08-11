global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        List<Lead> l1 = new List<Lead>();
        List<Lead> lds = [SELECT Id, LeadSource 
            FROM Lead 
            WHERE LeadSource = Null LIMIT 200];
        
        for (Lead mylds : lds) {
            mylds.LeadSource = 'DreamForce';
            //Lead cont = contacts.clone(false,false,false,false);
            l1.add(mylds);
        }
 
          // perform other processing or callout
        if (l1.size()>0){
        	upsert l1;
        }
    }
    
}