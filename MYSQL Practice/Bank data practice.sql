-- Find the names , street address and cities of residence for all employee who work in company and earn more than $10000
Create database bank ;
Use bank;
Create table employee(  name VARCHAR(60), Street VARCHAR(20),City VARCHAR(50));
select * from employee;
Insert into employee values ("Mahesh Sontake", "Aundh Road","Pune"),
("Pradeep Kumawat", "Magarpatta","Pune"),
("Pratik Gaikwad","JM Road","Pune"), 
("Avneet Kumar","Marine Drive","Mumbai"), 
("Ketan Pawar","Colaba","Mumbai"), 
("Ranveer Singh","Malabar hills","Mumbai"), 
("Santosh Padwal","Wardha Road","Nagpur"), 
("Kriti Deshmukh","Amravati Road","Nagpur"),
("Kartik Mane","Katol Raod","Nagpur"), 
("Dhiraj patel","Saraf Bazar","Nashik");

select * from employee;

create table Works( name VARCHAR(60) ,company_name VARCHAR(50) ,Salary int);
Alter table Works
drop column Salary;
-- TRUNCATE TABLE Works;  -- delete data in table

Alter table Works
Add Salary_usd decimal(10,2);


Insert into Works values ("Mahesh Sontake" ,"Bajaj Auto" ,2000.00),
("Pradeep Kumawat", "Infosys",11500.00),
("Pratik Gaikwad","Bharat Forge Ltd",80000.00), 
("Avneet Kumar","Reliance Industries Limited",12000.00 ), 
("Ketan Pawar","Netflix",15000.00), 
("Ranveer Singh","Tata Consultancy Services",10500.00), 
("Santosh Padwal","Tech Mahindra" ,9000.00), 
("Kriti Deshmukh","Ceat Tyre",9500.00),
("Kartik Mane","Larsen & Toubro (L&T)",15000.00), 
("Dhiraj patel","Alkem Laboratories ",6000.00);

select * from Works;

create table Company(company_name VARCHAR(60), city VARCHAR(20));


Insert into Company values("Bajaj Auto" ,"Pune"),
( "Infosys","Pune"),
("Bharat Forge Ltd","Pune"), 
("Reliance Industries Limited","Mumbai" ), 
("Netflix","Mumbai"), 
("Tata Consultancy Services","Mumbai"), 
("Tech Mahindra" ,"Mumbai"), 
("Ceat Tyre","Nagpur"),
("Larsen & Toubro (L&T)","Nagpur"), 
("Alkem Laboratories","Nashik");

select * from Company;

create table Manages( name VARCHAR(60), Manager_name VARCHAR(60));

Insert into Manages values("Mahesh Sontake","Rajiv Bajaj"),
("Pradeep Kumawat","Salil Parekh"),
("Pratik Gaikwad","Amit kalyani"), 
("Avneet Kumar","Prakash Shah"), 
("Ketan Pawar","Jinesh Gopani"), 
("Ranveer Singh","Monika Tiwari"), 
("Santosh Padwal","Priti Oswal"), 
("Kriti Deshmukh","Ashok Mahatre"),
("Kartik Mane","R.Keshav"), 
("Dhiraj patel","Ramesh Pandule");

Select * from Manages;
set sql_safe_updates=0;

SELECT name 
FROM employee 
JOIN works w ON name = w.name
WHERE w.Salary_usd > 10000;

-- Find name of employee working in which  companys
select name , company_name from works limit 10;

-- find name of employee working in infosyis 

select * from Works where company_name="Infosys" ;

-- find the name of all employess which leaves in same city

select * from employee where  city="pune"

