@istest
public class InsertContactsTest
{
    public static list<contact> createdataforf()
    {
        list<contact> lst = new list<contact>();
    		contact icon = new contact();
            icon.FirstName='FirstName';
            icon.lastname='LastName';
            icon.CleanStatus='Web';
            icon.Description='Description';
            icon.Department='Department';
            icon.Email='test@gmail.com';
            icon.Fax='90893983';
            icon.Phone='90787338389';
            lst.add(icon);
        return lst;
    }
    public static list<contact> createdatafort()
    {
        list<contact> lst = new list<contact>();
    		contact icon = new contact();
            icon.FirstName='FirstName';
            icon.lastname='LastName';
            icon.CleanStatus='Pending';
            icon.Description='Description';
            icon.Department='Department';
            icon.Email='test@gmail.com';
            icon.Fax='90893983';
            icon.Phone='90787338389';
            lst.add(icon);
        return lst;
    }
public static testmethod void testinsert()
{
    
       String requestBody = system.json.serialize(createdatafort());
       Test.startTest();
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/conservice';
        req.httpMethod = 'POST';
    req.addheader('Content-Type','application/json');
    req.addheader('Accept','application/json');
    req.requestBody = Blob.valueOf(requestBody);
 
        RestResponse res = new RestResponse();
        RestContext.request = req;
        RestContext.response = res;
 
        string result=InsertContacts.insertdata(); 
 
        Test.stopTest();

        System.assertEquals('SUCCESS', result);
    }
    public static testmethod void testinsertf()
{
    
       String requestBody = system.json.serialize(createdataforf());
       Test.startTest();
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/conservice';
        req.httpMethod = 'POST';
    req.addheader('Content-Type','application/json');
    req.addheader('Accept','application/json');
    req.requestBody = Blob.valueOf(requestBody);
 
       RestResponse res = new RestResponse();
        RestContext.request = req;
        RestContext.response = res;
 
        string result=InsertContacts.insertdata(); 
 
        Test.stopTest();
        System.assertEquals('FAILED', result);
        
    }
}