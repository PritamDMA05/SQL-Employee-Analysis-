create database interview;
use interview;
create table Employee(Emp_id int Not null, Emp_Name varchar(25), Gender char(10), Salary int, city char(20));
create table Employee_Detail(Emp_id int Not null, Project varchar(35), Emp_position char(20), DOJ date);

insert into Employee values (1, 'Arjun', 'M', 75000, 'Pune'),
 (2, 'Ekadanta', 'M', 125000, 'Bangalore'),
 (3, 'Lalita', 'F', 150000 , 'Mathura'), 
 (4, 'Madhav', 'M', 250000 , 'Delhi'), 
 (5, 'Visakha', 'F', 120000 , 'Mathura');
 
 insert into Employee_Detail values(1, 'P1', 'Executive', '2019-01-26'),
 (2, 'P2', 'Executive', '2020-05-04'),
 (3, 'P1', 'Lead', '2021-10-21'), 
 (4, 'P3', 'Manager', '2019-11-29'),
 (5, 'P2', 'Manager', '2020-08-01');   
 
#Q1 Find the list of employees whose salary ranges between 2L to 3L.
select Emp_Name from employee where salary between 200000 and 250000;


#Q2 Write a query to retrieve the list of employees from the same city.
select e1.emp_name, e1.emp_id, e1.city from employee e1, employee e2 where e1.city=e2.city and e1.emp_id<>e2.emp_id;


#Q3 Query to find the cumulative sum of employee’s salary.
select emp_id, sum(salary) over(order by emp_id) as cumilative from employee;


#Q4 What’s the male employees ratio.
select count(*) /100 from employee where gender="M";


#Q5 Write a query to fetch 50% records from the Employee table.
select emp_id, emp_name from employee where emp_id<=(select count(emp_id)/2 from employee);


#Q6 Write a query to fetch even rows from Employee table.
select* from (select row_number() over (order by emp_id) as rowstotal from employee) as totalc where mod(rowstotal,2)=0;


#Q7 Write a query to find all the Employee names whose name
select emp_name from employee where emp_name rlike '^[V].*[a]$';


#Q8 Find Nth highest salary from employee table
select emp_id, salary from employee e1 where 3-1=(select count(distinct(salary)) from employee e2  where e2.salary>e1.salary);
select max(salary) from employee e1 where salary<(select max(salary) from employee e2);

#Q9 Create 3 groups based on salary col, salary less than 1L is low, between 1-2L is medium and above 2L is High
select case
when salary < 100000 then "Low"
when salary > 100000 and salary <= 200000 then "med"
else "high"
end salary_type
from employee;


#q10 Query to pivot the data in the Employee table and retrieve the total salary for each city.
select sum(case when city="'Mathura" then salary end) mathura_salary,
sum(case when city="Bangalore" then salary else 0 end)bangalore_salary,
sum(case when city="Delhi" then salary else 0 end)delhi_salary
from employee;
