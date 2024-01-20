@istest
public class syncontactsTest {
    public static testmethod void testsync()
    {
        test.setmock(HttpCalloutMock.class,new contactsyncmock());
           string result= syncontacts.gettoken();
        	system.assertEquals('FAKE_TOKEN', result);
        //createdata();
        //syncontacts.contactsync();
    }
    public static testmethod void testinsert()
    {
        test.setmock(HttpCalloutMock.class,new insertconmock());
           string result= syncontacts.getres('{"attributes":{"type":"Contact","url":"/services/data/v59.0/sobjects/Contact/0035h00001KnKNGAA3"},"CleanStatus":"Pending","LastName":"CHECK","FirstName":"function changed","OwnerId":"0055h00000BMYvAAAX","sync__c":true,"Id":"0035h00001KnKNGAA3"}');
        	system.assertEquals('{"instance_url":"https://login.salesforce.com/services/oauth2/token","body":"FAKE_TOKEN"}', result);
        //createdata();
    }
     public static testmethod void syntest()
    {
        string res=syncontacts.contactsync();
        system.assertEquals('THERE IS NO DATA TO SYNC', res);
        
    }
}