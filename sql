CREATE TABLE family.fam
(
name varchar(12),
collegeid INTEGER(12),
PERCENT FLOAT(2,2),
GENDER ENUM("MALE","FEMALE","OTHERS") 
);
alter table family.fam rename to fami;
alter table fami add column val boolean, add column hobby varchar(20),add column dob date;
alter table fami modify column dob datetime;
alter table fami rename column dob to dateofbirth;  
alter table fami rename column dateofbirth to DOB, add column cap varchar(2),modify column hobby varchar(5);
alter table fami drop column hobby;
alter table fami modify column cap varchar(6);
select * from family.fami;  
ALTER TABLE FAMI MODIFY COLUMN DOB DATE;


SET SQL_SAFE_UPDATES=0;
insert into fami (name,collegeid,GENDER,val,cap) values ("manju",62211,"MALE",1,"m");
update fami set DOB = "2022-12-12"; 
DELETE FROM fam;
select name as nam, GENDER as gen,dob from fami;

-- day2;
select DOB from fami where DOB;
insert into fami (name,collegeid,GENDER,val,cap) values ("esai",621,"FEMALE",102,"manju");

-- clause
-- 1)where
select * from fami where DOB;
update fami set name = "esaivani" where collegeid="621";
delete from fami where collegeid="6221";

-- operator (AND, OR,NOT, IN,BETWEEN,like)
select * from fami where val>1; 
select * from fami where val>1 and val<100;
select * from fami where val>2 OR val<100;
select * from fami where collegeid IN("621","62","6");
select * from fami where collegeid NOT IN("621","62","6"); 
select * from fami where NOT val>1 and NOT COLLEGEID="100";
Select * from fami where val between 10 and 20;
select * from fami where collegeid like "%1%";

-- 2) distinct
select distinct collegeid from fami;


-- 3)limit
select * from fami limit 2; 
select * from fami where val<100 limit 2,3; 

-- order by
select * from fami where val>1 order by name asc;
select * from fami where val>1 order by name desc limit 2,3;

-- agreeegate (count,sum,avg,max,min)
select count(*) from fami;
select sum(collegeid) from fami;
select max(collegeid) from fami;
select min(collegeid) from fami;
select avg(collegeid) from fami;

-- group by
select * from fami group by collegeid;
select name ,count(*) from fami group by name;

-- having
select name,avg(val) from fami 
where val>10
group by name     
having avg(val)>1
order by name
limit 0,8; 
