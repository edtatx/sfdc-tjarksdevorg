@isTest
public class TestVerifyDate {
    @isTest static void testCheckDates1() {
        //within 30 days
        date myDate1 = date.newInstance(2017,02,21);
		date myDate2 = date.newInstance(2017,02,22);
		Date Date3=VerifyDate.CheckDates(myDate1,myDate2);
        System.assertEquals(myDate2, Date3);
    }
    
	@isTest static void testCheckDates2() {
        //outside 30 days
        date myDate1 = date.newInstance(2017,02,21);
		date myDate2 = date.newInstance(2017,06,22);
        date EndOfMonth = date.newInstance(2017,02,28);
		Date Date3=VerifyDate.CheckDates(myDate1,myDate2);
        System.assertEquals(EndOfMonth,Date3);
    }

//@isTest static void testCheckDates3() {
        //invalid dates
//        date myDate1 = date.newInstance(1111,aa,1);
//		date myDate2 = date.newInstance(2017,bb,22);
//		Date Date3=VerifyDate.CheckDates(myDate1,myDate2);
//      System.assertEquals(myDate1,myDate2);
//    }
}