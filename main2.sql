declare

    bg1 donor.gender%TYPE:='&x';
	c1 number:=0;
	error_notfound exception;
	invalid exception;
	
	
	
begin


           --Check valid input
            if(bg1 = 'A+' OR bg1 = 'A-' OR bg1 = 'B+' OR bg1 = 'B-' OR bg1 = 'AB+' OR bg1 = 'AB-' OR bg1 = 'O+' OR bg1 = 'O-')then
		       find_donor(bg1);
			else
			    raise invalid;
			end if;

 

		 
		 
		 
		 

EXCEPTION 
   WHEN error_notfound THEN 
      dbms_output.put_line('Not Found');
   WHEN invalid THEN 
      dbms_output.put_line('Invalid Input.Type Valid Blood Group');   

end;
/