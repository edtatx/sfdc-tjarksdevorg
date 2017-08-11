@IsTest (SeeAllData=True)
private class AccountManagerTest {

    @isTest static void testGetAccountById() {
        Id recordId = '0013600000y5Cig';
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://na30.salesforce.com/services/apexrest/Accounts/'
            + recordId +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
    }
}