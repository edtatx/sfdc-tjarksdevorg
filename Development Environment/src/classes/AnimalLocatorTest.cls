@isTest
public class AnimalLocatorTest {
  @isTest public static void AnimalLocatorMock() {
       Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        string result = AnimalLocator.getAnimalNameById(1);
      system.debug(result);
        String expectedResult = 'chicken';
        System.assertEquals(result,expectedResult );
    }
}