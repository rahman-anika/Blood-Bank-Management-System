clear screen;
set serveroutput on;
set verify off;

declare

    g donor.gender%TYPE:='&x';
	c1 number;
	error_notfound exception;
	invalid exception;
	
	
	
begin


         
            --Check valid input
            if(g = 'Male' OR g = 'Female')then
		       c1:=count_donor_by_gender(g);
			else
			    raise invalid;
			end if;

            --Check data found or not
         
            if(c1=0) then
		      raise error_notfound;
	     
		    else
		       dbms_output.put_line(c1);
            end if;
		 
		 
		 
		 
		 

EXCEPTION 
   WHEN error_notfound THEN 
      dbms_output.put_line('Not Found');
   WHEN invalid THEN 
      dbms_output.put_line('Invalid Input.Type Male or Female'); 


end;
/