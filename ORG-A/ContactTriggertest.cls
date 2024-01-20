@istest
public class ContactTriggertest 
{
public static testmethod void testtriggertrue()
{
    contact con = new contact();
    con.id='0035h00001KnXDvAAN';
    con.FirstName='Trigger123';
    update con;
}
    public static testmethod void testtriggerfalse()
{
    contact con = new contact();
    con.id='0035h00001KnXDvAAN';
    update con;
}
}