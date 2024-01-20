@istest
public class InsertContactsTest
{
    public static list<contact> createdataforfalse2()
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
    public static list<contact> createdataforfalse1()
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
        icon.id='0035h00001KnY1vAAF';
            lst.add(icon);
        return lst;
    }
    public static list<contact> createdatafortrue1()
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
        icon.id='0035h00001KnY1vAAF';
            lst.add(icon);
        return lst;
    }
    public static list<contact> createdatafortrue2()
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
    
       String requestBody = system.json.serialize(createdatafortrue1());
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
    
       String requestBody = system.json.serialize(createdatafortrue2());
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
    public static testmethod void testinsertfalse()
{
    
       String requestBody = system.json.serialize(createdataforfalse1());
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
        System.assertNotEquals('SUCCESS', result);
        
    }
    public static testmethod void testupsertfalse2()
{
    
       String requestBody = system.json.serialize(createdataforfalse2());
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
        System.assertNotEquals('SUCCESS', result);
        
    }
    
}