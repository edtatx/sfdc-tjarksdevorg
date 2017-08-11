public class AddPrimaryContact implements Queueable {
    
    private Contact contacts;
    private String state;
    
    public AddPrimaryContact(Contact contacts, String state) {
        this.contacts = contacts;
        this.state = state;
    }

    public void execute(QueueableContext context) {
        List <Contact> cts = new List <Contact>();
        List <Account> acts = [SELECT ID, Name, (Select ID, FirstName,LastName FROM Contacts) 
                               FROM Account Where BillingState = :state LIMIT 200];

        for (Account myacts : acts) {
            Contact cont = contacts.clone(false,false,false,false);
            cont.AccountID = myacts.Id;
            cts.add(cont);
 
          // perform other processing or callout
        }
        if (cts.size()>0){
        upsert cts;
        }
    }
    
}