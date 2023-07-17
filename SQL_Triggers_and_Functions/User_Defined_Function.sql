--  use studentdb;
--  
--  create table students(Rno int auto_increment primary key,marks int,sname varchar(30));
--  
--  create table subjects(Rno int,subject1 int,subject2 int,subject3 int,foreign key(Rno) references students(Rno));
--  
--  insert into students(Rno,marks,sname) values(1,60,'Ram');
--  
-- insert into students(Rno,marks,sname) values(1,60,'Ram');
-- insert into students(Rno,marks,sname) values(2,50,'Ganesh');
-- insert into students(Rno,marks,sname) values(3,55,'Sham');
-- insert into students(Rno,marks,sname) values(4,70,'Raj');

-- insert into subjects(Rno,subject1,subject2,subject3)values(1,10,20,20),(2,10,10,30),(3,20,25,10),(4,15,20,35);

-- select * from subjects;

# Scaler Functions
DELIMITER //
create function GetStudent(SRno INT)
returns varchar(50)
reads sql data
Begin
	RETURN (select sname from students where Rno=SRno);
END //
Delimiter ;

drop function GetStudent;


select GetStudent(1);