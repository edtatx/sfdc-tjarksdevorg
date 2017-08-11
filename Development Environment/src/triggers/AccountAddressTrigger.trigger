trigger AccountAddressTrigger on Account (before insert, before update) {
	List <Account> AccountList = new List <Account>();
    for (Account objAccount: Trigger.new) {
    if (objAccount.Match_Billing_Address__c) {
      objAccount.ShippingPostalCode = objAccount.BillingPostalCode;
        AccountList.add(objAccount);
    }
    }
}