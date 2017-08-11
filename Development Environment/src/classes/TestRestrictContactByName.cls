@isTest
public class TestRestrictContactByName {
    
     @isTest static void testInvalidName() {
        Contact cont = new Contact (LastName='INVALIDNAME');
        insert cont;
         
         Test.startTest();
         Database.SaveResult result = Database.insert(cont, false);
         Test.stopTest();
         
         System.assert(!result.isSuccess());
         System.assert(result.getErrors().size()>0);
         System.assertEquals('Cannot insert contact',result.getErrors()[0].getMessage());
    }
}