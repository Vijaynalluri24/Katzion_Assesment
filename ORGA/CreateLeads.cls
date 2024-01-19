public with sharing class CreateLeads {
    public static final integer count=1000;
    public static lead createleadrecord(string leadSource,integer i)
    {
        lead ld= new lead();
            ld.firstname='Test';
            ld.lastname='lead'+i;
            ld.company='Katzion';
            ld.leadsource=leadSource;
            return ld;
    }
   public static void genrateleads()
   {
    list<lead> lst = new list<lead>();
    for(integer i=1;i<=count;i++)
    {
       
        if(i>1 && i<=200)
        {
            lst.add(createleadrecord('Web',i));
        }
        else if(i>200 && i<=400)
        {
            lst.add(createleadrecord('Phone Inquiry',i));
            
        }
        else if(i>400 && i<=600)
        {
            lst.add(createleadrecord('Partner Referral',i));
        }
        else if(i>600 && i<=800)
        {
            lst.add(createleadrecord('Purchased List',i));
        }
        else if(i>800 && i<=1000)
        {
            lst.add(createleadrecord('Other',i));
        }
    }
   
    try {
        insert lst;
        System.debug('Data Inserted Successfully');
    } catch (Exception e) {
        system.debug('Data Insertion Failed');
    }
   }
}