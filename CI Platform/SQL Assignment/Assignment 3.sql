create database EmployeeDepartment;

create table Employee(
emp_id int primary key,
dept_id int null,
mngr_id int null,
emp_name varchar(50),
salary int null
)

create table Department(
dept_id int primary key,
dept_name varchar(50) 
)

insert into Employee values
(68319 ,1001,null,'KAYLING',6000),
(66928 ,3001,68319,'BLAZE',2750),
(67832 ,1001,68319,'CLARE',2550),
(65646 ,2001,68319,'JONAS',2957),
(67858 ,2001,65646,'SCARLET',3100),
(69062 ,2001,65646,'FRANK',3100),
(63679 ,2001,69062,'SANDRINE',900),
(64989 ,3001,66928,'ADELYN',1700),
(65271 ,3001,66928,'WADE',1350),
(66564 ,3001,66928,'MADDEN',1350),
(68454 ,3001,66928,'TUCKER',1600),
(68736 ,2001,67858,'ADNRES',1200),
(69000 ,3001,66928,'JULIUS',1050),
(69324 ,1001,67832,'MARKER',1400);

insert into  Department values
(1001,'FINANCE'),
(2001,'AUDIT'),
(3001,'MARKETING'),
(4001,'PRODUCTION');

select * from Employee
select * from Department


-- Query 1
 SELECT d.dept_name,e.salary ,e.emp_name FROM Employee e
join Department d
on e.dept_id=d.dept_id
join
	(select max(salary) as salary,dept_id
	from Employee e
	group by dept_id) as maximum
	on maximum.dept_id = d.dept_id AND e.salary = maximum.salary



-- Query 2

select  d.dept_name,COUNT(emp_id) as NoOfEmp
from Department d
join  Employee e
on d.dept_id=e.dept_id
GROUP BY d.dept_name
HAVING COUNT(emp_id) <6;


-- Query 3
select  d.dept_name,COUNT(emp_id) as NoOfEmp
from Department d
left join  Employee e
on d.dept_id=e.dept_id
GROUP BY d.dept_name

-- Query 4

select  d.dept_name,SUM(salary) as TotalSalary 
from Department d
left join  Employee e
on d.dept_id=e.dept_id
GROUP BY d.dept_name

