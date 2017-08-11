public with sharing class EmailManager {

    // Public method
    public static void sendMail(String address, String subject, String body) {
        // Create an email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        // Pass this email message to the built-in sendEmail method 
        // of the Messaging class
        //Debugging - system.debug('Sending Email to: '+address+'  '+subject+'  '+body);
        Messaging.SendEmail(
                                 new Messaging.SingleEmailMessage[] { mail });
    }
}