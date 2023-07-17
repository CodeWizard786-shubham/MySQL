# "view" is a virtual table that is derived from one or more tables or other views. It does not store any data itself but provides a way to present data from underlying tables in a customized or simplified manner.


use employeedb;

# create complex view on table emp

create view employee2 AS select emp.emp_name,project.Department from emp join project on emp.emp_id=project.emp_id;

drop view employee2;
# Diplay view(virtual) table employee2 -- having values from both the tables.
select * from employee2;

