public class StringArrayTest {

    public static List <string> generateStringArray(Integer n) {
    	List <string> arrayOfStrings = new List<String>(); 
        for (Integer i = 0; i<n; i++) {
            arrayOfStrings.add('Test '+i);
        }
        system.debug(arrayOfStrings);
        return arrayOfStrings;
    }
}