clear screen;
set serveroutput on;
set verify off;

declare

    d donation.d_id%TYPE:=&x;
	c1 number;
	error_notfound exception;
	invalid exception;
	
	
	
begin
            
		     c1:=count_donationtime_by_id(d);

            --Check data found or not
         
            if(c1=0) then
		      raise error_notfound;
	     
		    else
		       dbms_output.put_line('Number of donation: '||' '||c1);
			   donor_status(c1);
 
            end if;
		 		 
		 

EXCEPTION 
   WHEN error_notfound THEN 
      dbms_output.put_line('Not Found');
   


end;
/