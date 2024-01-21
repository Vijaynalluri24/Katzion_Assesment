import { LightningElement } from 'lwc';
import getleads from '@salesforce/apex/katzionleadcontroller.getleads';
import getallleads from '@salesforce/apex/katzionleadcontroller.getallleads';
import contactsync from'@salesforce/apex/syncontacts.contactsync';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
const pz=10;
const cols=[
    {label:'FIRST NAME',fieldName:'FirstName',type:'text'},
    {label:'LAST NAME',fieldName:'LastName',type:'text'},
    {label:'PHONE',fieldName:'Phone',type:'Phone'},
    {label:'RATING',fieldName:'Rating',type:'text'},
    {label:'LEAD SOURCE',fieldName:'LeadSource',type:'text'}
];
export default class Katzionleadlwc extends LightningElement {
    data;
    label;
    dis=false;
    currentpage=1;
    totalPages=1;
    value = null;
    lname = null;
    no=0;
    col=cols;
    pagesize=pz;
    constructor()
    {
        super();
        getallleads({ps:this.pagesize,cp:this.currentpage}).then(result=> {
            this.no=result.length;
            if(this.no==0)
                {
                    this.label='NO RECORDS FOUND/REACHED END OF DATA';
                    this.data=result;
                }
                else{
                    this.data=result;
                    this.label='Number Of Records In The Page Are: '+this.no;
                }
    }).catch(error=> {
            alert('Error in fetching the data while loading');
            console.log(error);
        })
    }
    get options() {
        return [
            { label: 'Web', value: 'Web' },
            { label: 'Phone Inquiry', value: 'Phone Inquiry' },
            { label: 'Partner Referral', value: 'Partner Referral' },
            { label: 'Purchased List', value: 'Purchased List' },
            { label: 'Other', value: 'Other' },
            { label: 'None', value: null },
        ];
    }
    handleChange(event) {
        this.value = event.detail.value;
        console.log(this.lname);
    }
    capname(event)
    {
        this.lname=event.target.value;
    }
    hangepagesizechange(event)
    {
        this.pagesize=event.target.value;
    }
    handleprev()
    {
        if(this.currentpage>1)
        {
            this.currentpage--;
            getleads({name:this.lname,filter:this.value,ps:this.pagesize,cp:this.currentpage}).then(result=> {
                this.no = result.length;
                if(this.no==0)
                {
                    this.label='NO RECORDS FOUND/REACHED END OF DATA';
                    this.data=result;
                }
                else{
                    this.label='Number Of Records In The Page Are: '+this.no;
                    this.data=result;
                    if(this.no<this.pagesize )
                {
                    this.dis=true;
                }
                else{
                    this.dis=false;
                }
                }
                
             }
                 
                 ).catch(error=> {
                 alert('Error in fetching the data');
                 console.log(error);
             })
        }
    }
    handlenext()
    {
            this.currentpage++;
            console.log(this.currentpage);
            this.nextiter=this.currentpage +1;
            getleads({name:this.lname,filter:this.value,ps:this.pagesize,cp:this.currentpage}).then(result=> {
                this.no = result.length;
                if(this.no==0)
                {
                    this.label='NO RECORDS FOUND/REACHED END OF DATA';
                    this.data=result;
                }
                else{
                    this.label='Number Of Records In The Page Are: '+this.no;
                    this.data=result;
                    if(this.no<this.pagesize )
                {
                    this.dis=true;
                }
                else{
                    this.dis=false;
                }
                }
                
             }
                 
                 ).catch(error=> {
                 alert('Error in fetching the data');
                 console.log(error);
             })

        
    }
    search()
    {
        this.currentpage=1;
        
        getleads({name:this.lname,filter:this.value,ps:this.pagesize,cp:this.currentpage}).then(result=> {
            this.no=result.length;
                if(this.no==0)
                {
                    this.label='NO RECORDS FOUND/REACHED END OF DATA';
                    this.data=result;
                }
                else{
                    this.label='Number Of Records In The Page Are: '+this.no;
                    this.data=result;
                    if(this.no<this.pagesize)
                {
                    this.dis=true;
                }
                else{
                    this.dis=false;
                }
                }
        }
            
            ).catch(error=> {
            alert('Error in fetching the data');
            console.log(error);
        })
    }
    sync()
    {
        contactsync().then(result=>{
            console.log(result);
                const evt = new ShowToastEvent({
                  title: 'SYNCHRONIZING CONTACTS',
                  message: result,
                  variant: 'success',
                });
                this.dispatchEvent(evt);
        }).catch(error=>{
            const evt = new ShowToastEvent({
                title: 'SYNCHRONIZING CONTACTS',
                message: result,
                variant: 'success',
              });
              this.dispatchEvent(evt);
        })
    }
    
}