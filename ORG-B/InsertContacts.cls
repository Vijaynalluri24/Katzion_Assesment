@restresource(urlmapping='/conservice/*')
global class InsertContacts
{
@HTTPPATCH()
    global static string insertdata()
    {
        list<contact> upsertCons=new list<contact>();
       
        map<string,id> exId = new map<string,id>();
       
        list<contact> conts =[select id, External_Id__c from contact where External_Id__c!=null ];
        for(contact c:conts)
        {
            exId.put(c.External_Id__c,c.id);
        }
       string data=restcontext.request.requestbody.tostring();
        system.debug(data);
      list<contact> lstcons=(list<contact>)system.json.deserialize(data,list<contact>.class);
        for(contact con:lstcons)
        {
            
                contact icon = new contact();
                if(exId.get(con.id)!=null)
                {
            
            icon.FirstName=con.FirstName;
            icon.lastname=con.LastName;
            icon.CleanStatus=con.CleanStatus;
            icon.Description=con.Description;
            icon.Department=con.Department;
            icon.Email=con.Email;
            icon.Fax=con.Fax;
            icon.Phone=con.Phone;
            icon.id=exId.get(con.id);
            upsertCons.add(icon);
                    
                   
                }
                else
                {
            
            icon.FirstName=con.FirstName;
            icon.lastname=con.LastName;
            icon.CleanStatus=con.CleanStatus;
            icon.Description=con.Description;
            icon.Department=con.Department;
            icon.Email=con.Email;
            icon.Fax=con.Fax;
            icon.Phone=con.Phone;
            icon.External_Id__c=con.id;
            upsertCons.add(icon);
                   
                }
            }
        //return upsertcons;
        
            if(!upsertCons.isempty())
            {
                try{
                upsert upsertcons;
                return 'SUCCESS';
                }
                catch(exception e)
       		 {
            return 'FAILED'+e.getmessage();
            
        		}
            }
                else
                {
                    return 'FAILED';
                    
                }
        }
}