@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
  
        
        String country = 'India';
    
        
        
        
        System.assertEquals(new List<String>{'Lal Bhag', 'Cubbon Park', 'Pazhassi Dam'},     ParkLocator.country(country)); 
    }
}