clear screen;
set serveroutput on;
set verify off;


drop table Donor1 cascade constraints;
drop table Donor2 cascade constraints;

create table Donor1(
d_id     integer, 
name   varchar2(10), 
age integer,
gender varchar2(10),
bg varchar2(6),
branch varchar2(12),
contactno varchar2(12),
        PRIMARY KEY (d_id)
);


create table Donor2(
d_id     integer, 
name   varchar2(10), 
age integer,
gender varchar2(10),
bg varchar2(6),
branch varchar2(12),
contactno varchar2(12),
        PRIMARY KEY (d_id)
);


insert into Donor1 values(1, 'Raj', 22,'Male','B+','Dhaka','019XXXXXXXX');
insert into Donor1 values(2, 'John',21,'Male','A-','Dhaka','017XXXXXXXX');
insert into Donor1 values(4, 'Shamim',26,'Male','A+','Dhaka','018XXXXXXXX');
insert into Donor1 values(6, 'Fariha',26,'Female','AB+','Dhaka','019XXXXXXXX');
insert into Donor1 values(7, 'Faiza', 22,'Female','AB+','Dhaka','019XXXXXXXX');




insert into Donor2 values(3, 'Rina', 22,'Female','B+','Chittagong','017XXXXXXXX');
insert into Donor2 values(5, 'Sabbir',28,'Male','B-','Chittagong','019XXXXXXXX');
insert into Donor2 values(8, 'Monir', 21,'Male','O+','Chittagong','015XXXXXXXX');
insert into Donor2 values(9, 'Neel', 22,'Male','A+','Chittagong','019XXXXXXXX');






drop table Donation cascade constraints;

create table Donation(
id integer,
d_id   integer, 
status varchar2(12),
        PRIMARY KEY (id),
        FOREIGN KEY(d_id) REFERENCES Donor(d_id)
);


insert into Donation values(1, 1, 'Non-Active');
insert into Donation values(2, 4, 'Non-Active');
insert into Donation values(3, 1, 'Non-Active');
insert into Donation values(4, 6, 'Non-Active');
insert into Donation values(5, 6, 'Non-Active');
insert into Donation values(6, 3, 'Non-Active');
insert into Donation values(7, 4, 'Non-Active');
insert into Donation values(8, 4, 'Non-Active');
insert into Donation values(9, 6, 'Non-Active');





drop table Campaign1 cascade constraints;
drop table Campaign2 cascade constraints;

create table Campaign1(
c_id     integer, 
name_of_campaign varchar2(37), 
organizer varchar2(10),
location varchar2(10),
c_date date,
     PRIMARY KEY (c_id)
);



create table Campaign2(
c_id     integer, 
name_of_campaign varchar2(37), 
organizer varchar2(10),
location varchar2(10),
c_date date,
     PRIMARY KEY (c_id)
);



insert into Campaign1 values(1, 'Blood:the gift of life', 'ABC','Dhaka','11 May,2020');
insert into Campaign1 values(2, 'Blood is a life, pass it on!', 'ABC','Dhaka','20 June,2020');
insert into Campaign1 values(4, 'Donot let the blood center run dry!', 'ABC','Chittagong','24 June,2020');
insert into Campaign1 values(7, 'Give Blood, Give Life', 'ABC','Dhaka','14 October,2020');
insert into Campaign1 values(8, 'Want to save a life today? Give blood', 'ABC','Chittagong','17 October,2020');



insert into Campaign2 values(3, 'Blood: It is in you to give', 'XYZ','Chittagong','11 May,2020');
insert into Campaign2 values(5, 'Donate! It is a bloody good job', 'XYZ','Dhaka','3 July,2020');
insert into Campaign2 values(6, 'From me to you:a gift of life', 'XYZ','Dhaka','9 September,2020');



drop table Participant cascade constraints;

create table Participant(
p_id     integer, 
c_id     integer,
d_id     integer, 
name varchar2(10),
bg varchar2(10),
     PRIMARY KEY (p_id),
	 FOREIGN KEY(d_id) REFERENCES Donor(d_id),
	 FOREIGN KEY(c_id) REFERENCES Campaign(c_id)
);



insert into Participant values(1, 1, 1,'Raj','B+');
insert into Participant values(2, 2, 4,'Shamim','A+');
insert into Participant values(3, 1, 6,'Fariha','AB+');
insert into Participant values(4, 4, 3,'Rina','B+');
insert into Participant values(5, 3, 1,'Raj','B+');
insert into Participant values(6, 7, 4,'Shamim','A+');

