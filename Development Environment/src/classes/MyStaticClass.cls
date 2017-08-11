public class MyStaticClass {
	Static Integer myInteger = 20;
    public static void myMethod (Integer multiplier) {
        Integer multiplicationResult;
        multiplicationResult=multiplier*myInteger;
        System.debug('Multiplication is: '+multiplicationResult+'   Multiplier: '+multiplier+'   myInterger: '+myInteger);
    }
}