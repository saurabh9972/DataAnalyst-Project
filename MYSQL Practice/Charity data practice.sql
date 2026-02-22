-- create the following table named "charity"
-- 1. diaplay all first names in lower case


create database Contribution;
use contribution;

create table charity(P_Id int , LastName VARCHAR(90) ,FirstName VARCHAR(90) ,Address VARCHAR(90) ,city VARCHAR(60) ,Contribution int );

insert into charity values (1, "Bindra","Jaspreet","5B,GomtiNagar","Lucknow",3500.50),
(2, "Rana" ,"Monica" ,"21A,Bandra","Mumbai",2768.00),(3, "Singh" ,"Jatinder" ,"8,Punjabi Bagh" ,"Delhi" ,2000.50),
(4, "Arora","Satinder","K/1,Shere Punjab Colony","Mumbai",1900.00),
(5,"Krishnan","Vineeta","A-75,AdarshNagar",Null ,Null );

select * from charity;

select Lower(FirstName) from charity;
select upper(LastName) from charity;

-- Display person id along with first three characters of his/her name 
select P_Id, Left(Firstname,3)  from charity;

select P_Id , left(coalesce(firstname,''),3) from charity group by P_Id ,firstname having count(*) >1;

-- display first name concatenated last name for all employees 
select concat(firstname," " ,lastname) as Fullname from charity group by firstname ,Lastname having count(*)>1;

-- display length of address along with person id

select P_Id , char_length(Address)  from charity group by P_Id, address having count(*)>1;

-- display last 2 character of city and person id 
select right(ifnull(city,'NA'),2) as city_last,right(ifnull(P_ID,'NA'),2) as person_id from charity;

-- display last name and first name of people who have "at" in second or third position of name 
select  lastname ,firstname from charity where locate ('at',firstname)  in(2,3) ;


-- display the position of 'a' in last name in each row 
select lastname ,locate('a',lastname) as position_of_a from charity;

-- display lastname and firstname of people who have "a" as the last character in their first names
select lastname,firstname from charity where firstname like '%a';

-- display address according to city 
select address,ifnull(city,'NA') as city_A from charity;

-- display the firstname and lastname concatenated after removing the leading and trailing blanks 

select concat(TRIM(firstname) , ' ' ,TRIM(lastname)) as full_name from charity limit 5;

-- display person id , lastname and contribution rounded to the nearest rupee of all persons

select distinct P_Id ,lastname ,Round(contribution) as contribution_rupee from charity ;

-- display person id and lastname and contribution with decimal digit truncated of all the persons
select p_id , lastname , truncate(contribution, 0) as contributions from charity;

-- display lastname ,contribution and a third column which has contribution divided by 10 round it to two decimal points
select lastname ,contribution ,round(contribution/10,2) as contribution_div from charity;