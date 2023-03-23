public class AssignmentFirst {
    public class ContactWrapper {
        @AuraEnabled public Contact contact {get;set;}
        @AuraEnabled public Account account {get;set;}
    }
    
    @AuraEnabled
    public static List<ContactWrapper> getContactWrappers(Id accountId) {
        List<ContactWrapper> wrappers = new List<ContactWrapper>();
        Account account = [SELECT BillingCity, BillingState FROM Account WHERE Id = :accountId];
        List<Contact> contacts = [SELECT Name, Email, Phone FROM Contact WHERE AccountId = :accountId];
        for (Contact c : contacts) {
            ContactWrapper wrapper = new ContactWrapper();
            wrapper.contact = c;
            wrapper.account = account;
            wrappers.add(wrapper);
        }
        return wrappers;
    }
}