@istest
public class KatzionLeadControllerTest {
    public static void createdata()
    {
        list<lead> lds = new list<lead>();
        for(integer i=1;i<=10;i++)
        {
            lead ld= new lead();
            ld.Company='test company';
            ld.LastName='Test'+i;
            ld.LeadSource='Web';
            lds.add(ld);
        }
        insert lds;
    }
public static testmethod void testcontroller()
{
    createdata();
    
    katzionleadcontroller.getleads('a','web',1,10);
    katzionleadcontroller.getleads(null,'web',1,10);
    katzionleadcontroller.getleads('a',null,1,10);
    katzionleadcontroller.getleads(null,null,1,10);
    katzionleadcontroller.getallleads(1,10);
}
}