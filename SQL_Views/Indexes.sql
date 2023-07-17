# Implement Index on sql tables
-- indexes icrease reading the particular columns from a table faster increasing fetch query performance. 
use employeedb;

# create index on emp table
create index employee_index on emp (emp_name,city,salary);

# create unique index
create unique Index employee_unique_index on emp (emp_name,city);

# Drop index from a column
drop index employee_index on emp;

drop index employee_unique_index on emp;

# display indexes from the particular table
show indexes from emp;
