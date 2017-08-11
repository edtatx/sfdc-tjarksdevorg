@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String acctId =
          request.requestURI.substringBetween('Accounts/','/contacts');
        Account result =  [SELECT Id, Name, (SELECT Id, Name FROM Contacts)
                        FROM Account
                        WHERE Id=:acctId];
        system.debug('results: '+result);
        return result;
    }
}