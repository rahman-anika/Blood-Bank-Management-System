clear screen;
set serveroutput on;
set verify off;

drop view Myview1;
create or replace view Myview1 as 
    select d_id,name,age,gender,bg,branch,contactno from Donor1
	UNION
	select d_id,name,age,gender,bg,branch,contactno from Donor2;
	   
	   
select * from Myview1;
commit;