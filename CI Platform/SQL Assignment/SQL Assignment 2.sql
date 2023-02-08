create table salesman(
salesman_id int,
name varchar(50),
city varchar(50),
commission Decimal(3,2)

)

create table customer(
customer_id int,
cust_name varchar(50),
city varchar(50),
grade int,
salesman_id int
)

create table orders(
ord_no int ,
purch_amt float,
ord_date Date,
customer_id int,
salesman_id int

)

/*Insert data into Table 1*/
Insert into salesman(salesman_id,name,city,commission)
Values( 5001, 'James Hoog','New york',0.15);

Insert into salesman(salesman_id,name,city,commission)
Values( 5002, 'Nail Knite','paris',0.13);

Insert into salesman(salesman_id,name,city,commission)
Values( 5005, 'Pit Alex','London',0.11);

Insert into salesman(salesman_id,name,city,commission)
Values( 5006, 'MC Lyon','paris',0.14);

Insert into salesman(salesman_id,name,city,commission)
Values( 5007, 'Paul Adam','Rome',0.13);

Insert into salesman(salesman_id,name,city,commission)
Values( 5003, 'Lauson Hen','San Jose',0.12);

select * from salesman


/*Insert data into Table 2*/
Insert into customer(customer_id,cust_name,city,grade,salesman_id)
Values (3002,'Mick Rimando','New York',100,5001);

Insert into customer(customer_id,cust_name,city,grade,salesman_id)
Values (3007,'Brad Davis','New York',200,5001);


Insert into customer(customer_id,cust_name,city,grade,salesman_id)
Values (3005,'Graham zusi','California',200,5002);


Insert into customer(customer_id,cust_name,city,grade,salesman_id)
Values (3008,'Julian Green','London',300,5002);


Insert into customer(customer_id,cust_name,city,grade,salesman_id)
Values (3004,'Fabian johnson','Paris',300,5006);


Insert into customer(customer_id,cust_name,city,grade,salesman_id)
Values (3009,'Geoff Cameron','Berlin',100,5003);


Insert into customer(customer_id,cust_name,city,grade,salesman_id)
Values (3003,'Jozy altidor','Moscow',200,5007);


Insert into customer(customer_id,cust_name,city,grade,salesman_id)
Values (3001,'Brad Guzan','London',Null,5005);

select * from customer


INSERT INTO orders VALUES
	(70001 , 150.5   , '2012-10-05' , 3005 , 5002 ),
	(70009 , 270.65  , '2012-09-10' , 3001 , 5005 ),
	(70002 , 65.26   , '2012-10-05' , 3002 , 5001 ),
	(70004 , 110.5   , '2012-08-17' , 3009 , 5003 ),
	(70007 , 948.5   , '2012-09-10' , 3005 , 5002 ),
	(70005 , 2400.6  , '2012-07-27' , 3007 , 5001 ),
	(70008 , 5760    , '2012-09-10' , 3002 , 5001 ),
	(70010 , 1983.43 , '2012-10-10' , 3004 , 5006 ),
	(70003 , 2480.4  , '2012-10-10' , 3009 , 5003 ),
	(70012 , 250.45  , '2012-06-27' , 3008 , 5002 ),
	(70011 , 75.29   , '2012-08-17' , 3003 , 5007 ),
	(70013 , 3045.6  , '2012-04-25' , 3002 , 5001 )

select * from salesman
select * from customer
select * from orders



/*Query 1*/


select s.name as salesman_name ,c.cust_name as customer_name, s.city as city from
salesman s
join 
customer c
on s.salesman_id = c.salesman_id
where s.city = c.city


/*Query 2*/

select o.ord_no, o.purch_amt, c.cust_name , c.city from
orders o 
join
customer c
on o.customer_id = c.customer_id
where purch_amt >=500 and purch_amt <= 2000

/*Query 3*/

select c.cust_name, c.city , s.name, s.commission from
customer c 
join 
salesman s
on c.salesman_id = s.salesman_id

/*Query 4*/
select c.cust_name, c.city,s.name,s.commission from 
customer c
join 
salesman s
on
c.salesman_id = s.salesman_id
where
s.commission > 0.12


/*Query 5-  */

select c.cust_name, c.city,s.name,s.city,s.commission from
customer c
join 
salesman s
on c.salesman_id = s.salesman_id
where c.city <> s.city

/*Query 6 -  */
select o.ord_no, o.ord_date, o.purch_amt,c.cust_name,c.grade,s.commission
from
orders o
right join
customer c
on o.customer_id = c.customer_id
right join
salesman s
on s.salesman_id = c.salesman_id



-- Query 8

select c.cust_name,c.city,c.grade,s.name,s.city
from
customer c
join
salesman s
on s.salesman_id=c.salesman_id
order by customer_id;


-- Query 9
select c.cust_name,c.city,c.grade,s.name,s.city
from
customer c
join
salesman s
on s.salesman_id=c.salesman_id
where c.grade<300
order by c.customer_id




--Query 10

select  c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt
from
customer c
join
orders o
on c.customer_id=o.customer_id
order by ord_date


--Query 11

select  c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt,s.name,s.commission
from 
customer c
left join
orders o
on c.customer_id=o.customer_id
left join
salesman s
on s.salesman_id=o.salesman_id


-- Query 12

select s.name,COUNT(c.customer_id) as Total_Customer 
from
salesman s
join
customer c
on s.salesman_id=c.salesman_id
group by name
having count(c.customer_id)>=1 or COUNT(c.customer_id)=0
order by s.name

-- Query 13


select s.name,s.salesman_id,s.city,s.commission, c.cust_name,c.city,c.grade,o.ord_no,o.ord_date,o.purch_amt
from
salesman s
left join
customer c
on s.salesman_id=c.salesman_id
left join
orders o
on o.salesman_id=c.salesman_id

-- Query 14
select * from salesman s
left join
customer c
on s.salesman_id = c.salesman_id
join
orders o
on o.customer_id = c.customer_id
where o.purch_amt >2000 and c.grade is not null

-- Query 16

select c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt from
customer c
right join
orders o
on c.customer_id = o.customer_id

-- Query 17

select s.name,s.city,s.salesman_id,s.commission,c.cust_name,c.city,c.customer_id,c.grade,c.salesman_id
from
salesman s
cross join
customer c

-- Query 18

select s.name,s.city,s.salesman_id,s.commission,c.cust_name,c.city,c.customer_id,c.grade,c.salesman_id
from
salesman s
cross join
customer c
where s.city=c.city


-- Query 19

select s.name,s.city,s.salesman_id,s.commission,c.cust_name,c.city,c.customer_id,c.grade,c.salesman_id
from
salesman s
cross join
customer c
where s.city=c.city and  c.grade is not null


-- Query 20
select s.name,s.city,s.salesman_id,s.commission,c.cust_name,c.city,c.customer_id,c.grade,c.salesman_id
from
salesman s
cross join
customer c
where s.city!=c.city and  c.grade is not null

