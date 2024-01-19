@istest
public class LeadCreateTest {
public static testmethod void  createlead()
{
    
   string res=CreateLeads.genrateleads();
    system.assertEquals('Data Inserted Successfully',res);
}
}