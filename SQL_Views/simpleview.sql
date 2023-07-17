use employeedb;

# Display original emp table.
select * from emp;

# create view of table 
create view employee1 as select emp_name,city from emp where emp_id=1;

# display the view table
select * from employee1;