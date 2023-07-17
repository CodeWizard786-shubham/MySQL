# create database  # DML
create database pythondb;
# select database
use pythondb;
# CRUD Operations

#1.create
create table employee(empid int(10) PRIMARY KEY,empname varchar(20),address varchar(100));
# Insert data into employee Table
insert into employee (empid,empname,address)values(1,'shubham','sindhudurg');
insert into employee (empid,empname,address)values(2,'Shreyash','Dhanu');
insert into employee (empid,empname,address)values(3,'shavez','Oros');


# 2.Read
select * from employee where empname='shubham';
desc employee;

#3.Update
update employee set address='kudal' where empid=1;
select * from employee;

#4. Delete from table
delete from employee where empid=2;

select * from employee;
