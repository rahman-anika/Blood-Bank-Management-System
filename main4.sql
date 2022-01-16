clear screen;
set serveroutput on;
set verify off;



declare

    l Campaign1.location%TYPE:='&x';
	c1 number;
	error_notfound exception;
	invalid exception;
	
	
	
begin


      --Check valid input
            if(l = 'Dhaka' OR l = 'Chittagong')then
		       c1:=count_campaign_by_location(l);
			else
			    raise invalid;
			end if;

            --Check data found or not
         
            if(c1=0) then
		      raise error_notfound;
	     
		    else
		       dbms_output.put_line(c1);
			   find_details_campaign(l);
			   
            end if;
		 
		 
		 
		 
		 

EXCEPTION 
   WHEN error_notfound THEN 
      dbms_output.put_line('Not Found');
   WHEN invalid THEN 
      dbms_output.put_line('Invalid Input.Type Dhaka or Chittagong'); 


end;
/