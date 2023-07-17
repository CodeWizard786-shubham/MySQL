# Create Table
create database employeedb;
use employeedb;

create table emp(emp_id int(10) primary KEY,emp_name varchar(20),city varchar(20),salary int(10),age int(5));

insert into emp values(1,'Angelina','Chicago',200000,30);
insert into emp values(2,'Robert','Austin',300000,26);
insert into emp values(3,'Angelina','Denver',100000,42);
insert into emp values(4,'Angelina','Washington',500000,29);
insert into emp values(5,'Russel','Los angeles',200000,36);
insert into emp values(6,'Marry','Canada',600000,48);

create table project(project_no int(10) PRIMARY KEY,emp_id int,Department varchar(20),foreign key(emp_id) references emp(emp_id));

insert into project values(101,1,'Testing');
insert into project values(102,2,'Development');
insert into project values(103,3,'Designing');
insert into project values(104,4,'Development');

select * from emp;
# Join Operations:
# 1. Inner join
select emp.emp_name,project.department from emp INNER JOIN project on project.emp_id = emp.emp_id;

# 2. Left Outer Join
# The Left-Outer Join is an outer join that returns all the values of the left table, and the values of the right table that has matching values in the left table. 
select emp.emp_name,project.department from emp left JOIN project on project.emp_id = emp.emp_id;

# 3. Right Outer Join
#The Right-Outer Join is an outer join that returns all the values of the right table, and the values of the left table that has matching values in the right table. 
select emp.emp_name,project.department from emp right JOIN project on project.emp_id = emp.emp_id;

# 4. Full Outer Join
# The Full-Outer join contains all the values of both the tables whether they have matching values in them or not.
select * from emp FULL JOIN project;

# 5. Natutal join 
# Natural Join is an inner join that returns the values of the two tables on the basis of a common attribute that has the same name and domain.
select * from emp NATURAL JOIN project;

# 6 . Self Join
select * from emp a,emp b where a.emp_id = b.emp_id;