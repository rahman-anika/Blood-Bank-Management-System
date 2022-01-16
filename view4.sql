clear screen;
set serveroutput on;
set verify off;



drop view Myview4;
create or replace view Myview4 as 
  select p.p_id,d.name,d.bg,d.branch,c.organizer,c.location,c.c_date 
  from Donor d inner join Participant p 
  on d.d_id=p.d_id 
  inner join Campaign c 
  on c.c_id=p.c_id 
  order by p.p_id ASC;
  
  
  
select * from Myview4;
commit;