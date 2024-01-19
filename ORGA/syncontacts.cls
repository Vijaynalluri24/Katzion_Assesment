public with sharing class syncontacts {
    public static string getres(string reqbody)
    {
        http oh=new http();
            httprequest ore = new httprequest();
            httpresponse ores= new httpresponse();
            ore.setMethod('POST');
            ore.setbody(reqbody);
            ore.setendpoint('https://mindful-wolf-te18p4-dev-ed.trailblaze.my.salesforce.com/services/apexrest/conservice');
            ore.setHeader('Authorization','OAuth '+gettoken());
            ore.setHeader('Content-Type','application/json');
            ores=oh.send(ore);
            return(ores.getbody());
    }
    public static string gettoken()
    {
        string accessToken;
        string body ='grant_type=password&client_id='+system.label.BCkey+
        '&client_secret='+system.label.BCsecret+
         '&username='+system.label.Busername+'&password='+system.label.Bpswd;
        http h= new http();
        httprequest hreq= new httprequest();
        httpresponse hres = new httpresponse();
        hreq.setMethod('POST');
        hreq.setendpoint('https://login.salesforce.com/services/oauth2/token');
        hreq.setbody(body);
        hres=h.send(hreq);
        System.JSONParser aParser = System.JSON.createParser(hres.getBody());
        While(aParser.nextToken() != null)
        {
            if(aParser.getCurrentToken() == JsonToken.FIELD_NAME && aParser.getText() == 'access_token')
            {
                aParser.nextToken();
                accessToken = aParser.getText();
            }
        }
        return accessToken;
    }
    @AuraEnabled
    public static string contactsync()
    {
    
    list<contact> toupdate = new list<contact>();
        list<contact> lstcons=[select AccountId,CleanStatus,lastname,firstname,OwnerId,Description,Department,Email,Fax,Phone,sync__c from contact where sync__c=false];
        if(!lstcons.isempty())
        {
        string accesstoken =gettoken();
        system.debug(lstcons);
        string reqbody=system.json.serialize(lstcons);
        system.debug(reqbody);
        string res=getres(reqbody);
         system.debug(accesstoken);
         if(accesstoken != null)
         {
            
            if(res=='"SUCCESS"')
            {
                for(contact con:lstcons)
                {
                    con.sync__c=true;
                    toupdate.add(con);
                }
                try{
                    update toupdate;
                    return 'SYNC SUCCESSFULL';
                }
                catch(exception e)
                {
                    return 'SYNC FAILED WITH EXCEPTION'+e.getmessage();
                }

            }
            else{
                return res;
            }
         }
         else{
            return 'AUTHENTICATION TO THE ACCESSING ORG FAILED';
         }
        }
        else{
            return 'THERE IS NO DATA TO SYNC';
        }
    }
}