public class insertconmock implements HttpCalloutMock {
    public httpresponse Respond(httprequest req)
    {
        httpresponse fres = new httpresponse();
        fres.setHeader('Content-Type','application/json');
        fres.setbody('{"instance_url":"https://login.salesforce.com/services/oauth2/token","body":"FAKE_TOKEN"}');
        fres.setstatuscode(200);
        return fres;
    }

}