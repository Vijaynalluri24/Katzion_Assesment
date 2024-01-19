@restresource(urlmapping='/conservice/*')
global class InsertContacts
{
@HTTPPOST()
    global static string insertdata()
    {
        list<contact> inscons=new list<contact>();
       string data=restcontext.request.requestbody.tostring();
        system.debug(data);
       // return data+'from second method';
        list<contact> lstcons=(list<contact>)system.json.deserialize(data,list<contact>.class);
        for(contact con:lstcons)
        {
            contact icon = new contact();
            icon.FirstName=con.FirstName;
            icon.lastname=con.LastName;
            icon.CleanStatus=con.CleanStatus;
            icon.Description=con.Description;
            icon.Department=con.Department;
            icon.Email=con.Email;
            icon.Fax=con.Fax;
            icon.Phone=con.Phone;
            inscons.add(icon);
        }
        //return lstcons;
        try{
            insert inscons;
            return 'SUCCESS';
        }
        catch(exception e)
        {
            return 'FAILED'+e.getmessage();
        }
        
    }
}