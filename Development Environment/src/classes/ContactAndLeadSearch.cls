public class ContactAndLeadSearch {
   
    public static List<List<SObject>> searchContactsAndLeads(String nam) {
        List<List<SObject>> searchlist = [FIND :nam IN NAME FIELDS RETURNING Contact(FirstName,LastName), Lead(FirstName,LastName)];
		  system.debug('Name: '+nam+'  Found: '+searchlist);
        return searchlist;
    }
}