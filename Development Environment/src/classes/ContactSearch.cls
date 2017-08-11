public class ContactSearch {    
    
    public static List<Contact> searchForContacts(String lnam, String pcode) {
        List<Contact> cts = [SELECT ID, Name FROM Contact WHERE (LastName =: lnam AND MailingPostalCode =: pcode)];
        system.debug('Contacts Retrieved: '+cts);
        return cts;
    }
}