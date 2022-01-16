clear screen;
set serveroutput on;
set verify off;




create or replace procedure find_donor(bg1 in donor.bg%TYPE)
	is


c1 number:=0;


begin

     dbms_output.put_line('d_id'||'		'||'name'||'		'||'age'||'		'||'gender'||'			'||'bg'||'		'||'branch'||'		'||'contactno');  
     for R in
	    
		((select d_id,name,age,gender,bg,branch,contactno from donor1 where bg=bg1)
		   
		   UNION
			
		 (select d_id,name,age,gender,bg,branch,contactno from donor2 where bg=bg1))
		
		
		    --dbms_output.put_line('d_id' || ' '||'name'||' ' || 'age'||' ' || 'gender'||' ' || 'bg'||' ' || 'branch'||' ' || 'contactno');
		
		LOOP
		
		     
			 dbms_output.put_line(R.d_id||'		'||R.name||'		'||R.age||'		'||R.gender||'			'||R.bg||'		'||R.branch||'		'||R.contactno);
			 
			 c1:=c1+1;
            --dbms_output.put_line(c1);
		
		End Loop;



       if(c1=0) then
	  
	     dbms_output.put_line('Not Found');
	  end if;



end find_donor;
/





create or replace procedure donor_status(c1 in number)
	is


--c1 number:=0;


begin

       if(c1>2) then
	     dbms_output.put_line('Status : Active Member');
	    else
		 dbms_output.put_line('Status : Non-Active Member');
	  end if;



end donor_status;
/








create or replace procedure find_status(c out number)
	is


--c number:=0;


begin

       For R in
           (select d_id from Donation having count(id)>2  group by d_id)LOOP
	 
            --dbms_output.put_line(R.d_id);
			update Donation set status='Active' where d_id=R.d_id;
			c:=1;
	 
	 End Loop;



end find_status;
/




create or replace procedure find_details_campaign(l in Campaign1.location%TYPE)
	is


c1 number:=0;


begin

     dbms_output.put_line('c_id'||'	'||'organizer'||'	 '||'location'||'	  '||'c_date'||'		 '||'name_of_campaign');  
     for R in
	    
		((select c_id,name_of_campaign,organizer,location,c_date from Campaign1 where location=l)
          UNION
        (select c_id,name_of_campaign,organizer,location,c_date from Campaign2 where location=l))
		
		LOOP
		
		     
			 dbms_output.put_line(R.c_id||'	'||R.organizer||'		'||R.location||'		'||R.c_date||'	'||R.name_of_campaign);
			 
			 c1:=c1+1;
            --dbms_output.put_line(c1);
		
		End Loop;



       if(c1=0) then
	  
	     dbms_output.put_line('Not Found');
	  end if;



end find_details_campaign;
/
