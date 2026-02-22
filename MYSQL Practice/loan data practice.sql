create database loan_A;
use loan_A;

create table loan5(AccNO Int  , Cust_Name VARCHAR(40)  ,
Loan_Amount Int , Installments int  , Int_Rate decimal(5,3),
Start_Date Date  ,Interest bigint(15) , primary key(AccNo));


alter table loan5
modify Int_Rate decimal(5,2);

alter table loan5
drop primary key;

insert into loan5(AccNo,Cust_Name,Loan_Amount,Installments,Int_Rate,Start_Date) values(1, "R.K.Gupta" ,300000 ,36 , 12.00,"2009-07-19");
insert into loan5(AccNo,Cust_Name,Loan_Amount,Installments,Int_Rate,Start_Date) values(2,"S.P.Sharma",500000,48,10.00,"2008-03-22");
insert into loan5(AccNo,Cust_Name,Loan_Amount,Installments,Int_Rate,Start_Date) values(3,"K.P.Jain",300000,36,Null,"2007-03-08");
insert into loan5(AccNo,Cust_Name,Loan_Amount,Installments,Int_Rate,Start_Date) values(4,"M.P.Yadhav",800000,60,10.00,"2008-12-06");
insert into loan5(AccNo,Cust_Name,Loan_Amount,Installments,Int_Rate,Start_Date) values(5,"S.P.Sinha",200000,36,12.50,"2010-01-03");
insert into loan5(AccNo,Cust_Name,Loan_Amount,Installments,Int_Rate,Start_Date) values(6,"P.Sharma",700000,60,12.50 ,"2008-06-05");
insert into loan5(AccNo,Cust_Name,Loan_Amount,Installments,Int_Rate,Start_Date) values(7,"K.S.Dhall", 500000 ,47 ,Null ,"2008-03-05");

select * from loan5;

-- Display the AccNo, Cust_Name, and Loan_Amount of all the loans
select AccNo , Cust_Name ,Loan_Amount from loan5;

-- Display the details of all the loans with less than 40 instalments
select * from loan5 where Installments<40;

--  Display the AccNo and Loan_Amount of all the loans started before 01-04-2009.
select AccNo , Loan_Amount from loan5 where Start_date < '2009-04-01';

-- Display the Int_Rate of all the loans started after 01-04-2009.
select Int_Rate from loan5 where start_date > '2009-04-01';

-- Display the details of all the loans whose rate of interest is NULL.
select * from loan5 where Int_Rate is Null;

-- Display the details of all the loans whose rate of interest is not NULL.
select * from loan5 where int_rate is not null;

-- Display the amounts of various loans from the table Loan_Accounts. A loan amount should appear only once.
select Distinct Loan_Amount from loan5;

-- Display the number of instalments of various loans from the table Loan_Accounts. An instalment should appear only once
select distinct installments from loan5;

-- Display the details of all the loans started after 31-12-2008 for which the number of instalments are more than 36.
select * from loan5 where Start_Date > "2008-12-31" AND Installments >36;

--  Display the Cust_Name and Loan_Amount for all the loans which do not have number of instalments 36.
select Cust_Name ,Loan_Amount from loan5 where Installments<>36;

-- Display the Cust_Name and Loan_Amount for all the loans for which the loan amount is less than 500000 or int_rate is more than 12.
select Cust_Name ,Loan_Amount from loan5 where Loan_Amount<500000 OR Int_Rate >12;

-- Display the details of all the loans which started in the year 2009.
Select * from loan5 where start_date > '2009-01-01';

-- Display the details of all the loans whose Loan_Amount is in the range 400000 to 500000.
select Loan_Amount from loan5 where Loan_Amount>=400000 and Loan_Amount<=500000;

-- Display the details of all the loans whose rate of interest is in the range 11% to 12%.
select * from loan5 where Int_Rate>=11 and Int_Rate<=12;

-- Display the Cust_Name and Loan_Amount for all the loans for which the number of instalments are 24, 36, or 48. 
select cust_name ,loan_amount from loan5 where installments in (24,36,48);

-- Display the details of all the loans whose Loan_Amount is in the range 400000 to 500000
select loan_amount from loan5 where loan_amount between 400000 and 500000;

-- Display the details of all the loans whose rate of interest is in the range 11% to 12%.
select * from loan5 where Int_Rate between 11 and 12;

-- Display the AccNo, Cust_Name, and Loan_Amount for all the loans for which the Cust_Name ends with 'Sharma'
select AccNo ,Cust_Name ,Loan_Amount from loan5 where Cust_Name like '%Sharma';

-- Display the AccNo, Cust_Name, and Loan_Amount for all the loans for which the Cust_Name ends with 'a'.
select AccNo ,Cust_Name ,Loan_Amount from loan5 where Cust_name like '%a';

-- Display the AccNo, Cust_Name, and Loan_Amount for all the loans for which the Cust_Name contains 'a'
select AccNo ,Cust_name ,Loan_Amount from loan5 where Cust_name like '%a%';

-- Display the AccNo, Cust_Name, and Loan_Amount for all the loans for which the Cust_Name does not contain 'P'.
select AccNo , Cust_name ,Loan_Amount from loan5 where Cust_name not like '%p%';

-- Display the AccNo, Cust_Name, and Loan_Amount for all the loans for which the Cust_Name contains 'a' as the second last character
select AccNO , Cust_name ,Loan_amount from loan5 where Cust_name like '%a_%';

-- Display the details of all the loans in the ascending order of their Loan_Amount. 
select * from loan5 Order by Loan_Amount;

-- select * from loan5 order by Cust_name Asc;
-- Display the details of all the loans in the descending order of their Start_Date.
select * from loan5 order by Start_date desc;

-- Display the details of all the loans in the ascending order of their Loan_Amount and within Loan_Amount in the descending order of their Start_Date.
select * from loan5 order by Loan_Amount asc , Start_date desc;

--  # . Put the interest rate 11.50% for all the loans for which interest rate is NULL.(update )
SET SQL_SAFE_UPDATES = 0;
update loan5 SET Int_Rate =11.50 where Int_Rate is Null;

-- Increase the interest rate by 0.5% for all the loans for which the loan amount is more than 400000.
update loan5 Set Int_Rate =Int_Rate+0.5 where Loan_amount >400000;

-- For each loan replace Interest with (Loan_Amount*Int_Rate*Instalments)/(12*100).
update loan5 set interest = (Loan_Amount*Int_Rate*Installments)/(12*100);

select * from loan5;
