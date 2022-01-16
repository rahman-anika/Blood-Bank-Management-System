clear screen;
set serveroutput on;
set verify off;


create or replace function count_donor_by_gender(g in donor.gender%TYPE)
	return number
	is


g_donor1 number:=0;
g_donor2 number:=0;
g_donor number:=0;




begin

	
	
	select count(d_id) into g_donor1 from Donor1 where gender=g;
	select count(d_id) into g_donor2 from Donor2 where gender=g;
	
	
	g_donor:=g_donor1+g_donor2;
	
	
	return g_donor;

end count_donor_by_gender;
/




create or replace function count_donationtime_by_id(d in donation.d_id%TYPE)
	return number
	is
	
  d_time number:=0;


begin

	
	
	select count(id) into d_time from Donation where d_id=d;
	
	
	--c:=g_donor;
	
	
	return d_time;

end count_donationtime_by_id;
/



create or replace function count_campaign_by_location(l in Campaign.location%TYPE)
	return number
	is


l_campaign number:=0;
l_campaign1 number:=0;
l_campaign2 number:=0;


begin

	
	
	select count(c_id) into l_campaign1 from Campaign1 where location=l;
	select count(c_id) into l_campaign2 from Campaign2 where location=l;
	
	
       --c:=l_campaign;
	  l_campaign:=l_campaign1+l_campaign2;
	
	return l_campaign;

end count_campaign_by_location;
/

