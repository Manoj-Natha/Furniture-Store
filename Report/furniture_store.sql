drop table manager;
drop table sales_man;
drop table billing_person;
drop table employee_salary;
drop table employees;

drop table order_items;
drop table orders;
drop table bill_items;
drop table bills;
drop table customer;
drop table product;

--1
create table customer(
cid varchar(15) primary key,
fname varchar(15),
lname varchar(15),
mname varchar(15),
pno number(10),
address varchar(30),
dob date,
email varchar(30)
);



insert into customer values('C101','Manoj Kumar','','Natha',4697407546,'Richardson, TX','31-jul-1993','natha.manoj@gmail.com');
insert into customer values('C102','Chaithanya','venkata','V',5305121507,'Dallas, TX','02-jun-1994','vvsaichaithanya@gmail.com');
insert into customer values('C103','Abhitej','','B',4697407545,'Dallas, TX','29-sep-1993','abhitejb@gmail.com');
insert into customer values('C201','Nurcan','','Yuruk',4697401111,'Frisco, TX','01-jan-1975','nurcan.yuruku@utdallas.edu');
insert into customer values('C202','Venkatesh','','M',4697658789,'Chicago, IL','21-oct-1991','venky.mandapati@gmail.com');


--2

create table product(
pid varchar(15) primary key,
pname varchar(15),
category varchar(15),
price number(10,2),
qty_left integer
);

insert into product
values('P1','dining table','dining',600,50);
 
insert into product
values('P2','chairs','living',300,100);
 
insert into product
values('P3','sofas','living',900,10);
 
insert into product
values('P4','bed frame','bed room',250,20);
 
insert into product
values('P5','computer table','office',80,40);


--3


create table employees(
ssn number(9) primary key,
ename varchar(20),
dob date,
address varchar(30),
email varchar(30),
pno number,
pay_scale number(6,2)
);

insert into employees
values(324323246,'maria','08-AUG-1965','Dallas,TX','maria@ufdepot.com',1234567890,40.5);
 
insert into employees
values(324312126,'nurcan','30-AUG-1975','Frisco, TX','nurcan@ufdepot.com',1230967490,70);
 
insert into employees
values(300011246,'jey','18-JUL-1950','Irving, TX','jey@ufdepot.com',4569871230,90.25);
 
insert into employees
values(363457892,'john','25-JUN-1925','Allen, TX','john@ufdepot.com',664555678,100);
 
insert into employees
values(324561088,'shyam','03-AUG-1945','Denton, TX','shyam@ufdepot.com',123434663,60.50);

--4

create table manager(
ssn number(9) references employees(ssn) primary key,
dept varchar(15)
);

insert into MANAGER
values(324312126,'Billing');
 
insert into manager
values(300011246,'sales');

--5
create table sales_man(
ssn number(9) references employees(ssn) primary key,
sale_score integer
);

insert into sales_man
values(363457892,8);
 
insert into sales_man
values(324561088,5);

--6

create table billing_person(
ssn number(9) references employees(ssn) primary key,
counter_no integer
);

insert into billing_person values(324323246,1);


--7

create table employee_salary(
ssn number(9) references employees(ssn),
sal_date date ,
hours number(10,2),
salary number(10,2),
primary key(ssn,sal_date)
);


insert into employee_salary values(324323246,'16-nov-2015',15,607.5);
insert into employee_salary values(324312126,'16-nov-2015',35,2450);
insert into employee_salary values(300011246,'16-nov-2015',25,2256.25);
insert into employee_salary values(363457892,'16-nov-2015',15,1500);
insert into employee_salary values(324561088,'16-nov-2015',30,1815);



--8

create table orders(
oid varchar(15) primary key,
amount number(10,2),
ord_date date
);

--9

create table order_items(
oid varchar(15) references orders(oid),
pid varchar(15) references product(pid),
qty integer,
purchase_price number(10,2),
primary key(oid,pid)
);

--10

create table bills(
bid varchar(15) primary key,
cid varchar(15) references customer(cid),
total_amt number(10,2),
bill_date date
);


--11

create table bill_items(
bid varchar(15) references bills(bid),
pid varchar(15) references product(pid),
qty integer,
primary key(bid,pid)
);

