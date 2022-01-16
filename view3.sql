clear screen;
set serveroutput on;
set verify off;



drop view Myview3;
create or replace view Myview3 as 
        select c_id,name_of_campaign,organizer,location,c_date from Campaign1 
		Union
        select c_id,name_of_campaign,organizer,location,c_date from Campaign2;
	   
	   

commit;
select * from Myview3;