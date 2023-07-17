create database studentdb;
/* create trigger [trigger_name] 
[before | after]  
{insert | update | delete}  
on [table_name]  
[for each row]  
[trigger_body] */ 

use studentdb;

create table student(id int auto_increment PRIMARY KEY,sname varchar(20),subject1 int , subject2 int,subject3 int,total int,percentage float); 

# DQl Trigger 



# DML Trigger
# creating tirgger to automatically calucalte total and percentage of subjects.
create TRIGGER stud_marks before insert on student for each row 
set NEW.total = NEW.subject1 + NEW.subject2 + NEW.subject3,
NEW.percentage = (NEW.subject1+NEW.subject2+NEW.subject3)/300*100;

# inserting data into table.
insert into student(id,sname,subject1,subject2,subject3) values(1,'Ram',34,34,56);
insert into student(sname,subject1,subject2,subject3) values('Sam',45,54,76);
insert into student(sname,subject1,subject2,subject3) values('Hum',44,24,75);
insert into student(sname,subject1,subject2,subject3) values('hello',44,24,75);


select * from student;