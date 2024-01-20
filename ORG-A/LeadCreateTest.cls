@istest
public class LeadCreateTest {
    @testsetup static void setupdata()
    {
        lead ld = new lead();
        ld.FirstName='Test';
        ld.LastName='Setup';
        ld.Company='Katzion';
        insert ld;
    }
public static testmethod void  createlead()
{
    
   string res=CreateLeads.genrateleads();
    system.assertEquals('Data Inserted Successfully',res);
}
}