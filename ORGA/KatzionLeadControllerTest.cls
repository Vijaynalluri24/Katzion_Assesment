@istest
public class KatzionLeadControllerTest {
    @testsetup()
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
    
    system.assertNotEquals(null,katzionleadcontroller.getleads('a','web',1,10));
    system.assertNotEquals(null,katzionleadcontroller.getleads(null,'web',1,10));
    system.assertNotEquals(null,katzionleadcontroller.getleads('a',null,1,10));
    system.assertNotEquals(null,katzionleadcontroller.getleads(null,null,1,10));
    system.assertNotEquals(null,katzionleadcontroller.getallleads(1,10));
}
}
