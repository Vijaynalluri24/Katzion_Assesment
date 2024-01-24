public with sharing class katzionleadcontroller {
    @AuraEnabled(cacheable=true)
    public static list<lead> getleads(string name, string filter,integer ps,integer cp)
    {
            if(name!=null)
            {
                name=name+'%';
            }
            

            integer offset=(cp-1)*ps;

            if(filter != null && name != null)
            {
                return [select id,firstname,lastname,phone,rating,leadsource from lead where firstname like:name and leadsource=:filter ORDER BY firstname Limit :ps OFFSET :offset ];
            }
            else if(name != null && filter==null) {
                return [select id,firstname,lastname,phone,rating,leadsource from lead where firstname like:name ORDER BY firstname Limit :ps OFFSET :offset ];
                
                
            }
            else if(name==null && filter != null)
            {
                return [select id,firstname,lastname,phone,rating,leadsource from lead where leadsource=:filter ORDER BY firstname Limit :ps OFFSET :offset ];
            }
            else 
            {
                return [select id,firstname,lastname,phone,rating,leadsource from lead ORDER BY firstname Limit :ps OFFSET :offset ];
            }  
    }
   /* @AuraEnabled(cacheable=true)
    public static list<lead> getallleads(integer ps,integer cp)
    {
        integer offset=(cp-1)*ps;
        return [select id,firstname,lastname,phone,rating,leadsource from lead ORDER BY firstname Limit :ps OFFSET :offset ];
    }*/
    }
