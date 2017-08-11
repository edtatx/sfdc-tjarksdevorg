public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer numCont, String lname) {
        List<Contact> cont = new List<Contact>();
        
        for(Integer i=0;i<numCont;i++) {
            Contact c = new Contact(firstname='Test'+i,lastname=lname);
            cont.add(c);
        }
        //insert cont;
       return cont;
    }
}