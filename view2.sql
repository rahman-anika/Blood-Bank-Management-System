clear screen;
set serveroutput on;
set verify off;


declare
	
    c number:=0;	
	
begin
     find_status(c);
	 

end;
/



drop view Myview2;
create or replace view Myview2 as 
        select d1.d_id,d1.name,d1.bg,d1.branch,d1.contactno,b.status
		from Donor1 d1,Donation b where d1.d_id=b.d_id
		Union
       select d2.d_id,d2.name,d2.bg,d2.branch,d2.contactno,b.status
	   from Donor2 d2,Donation b where d2.d_id=b.d_id;

	   
	   
select * from Myview2;
commit;