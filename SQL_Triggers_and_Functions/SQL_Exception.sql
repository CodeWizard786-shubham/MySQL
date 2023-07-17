
use studentdb;
show tables;
desc students;
DELIMITER //

CREATE PROCEDURE insert_proc(IN insid INT, marks INT, sname VARCHAR(20))
BEGIN
    DECLARE EXIT HANDLER FOR 1062 SELECT CONCAT('Duplicate key (', insid,' ',marks,' ', sname, ') occurred') AS message;
    declare exit handler for sqlexception select 'SQlException Encountered' MESSAGE;
    declare exit handler for sqlstate '23000' select 'SQLSTATE 23000' ERRORCODE;

	# insert new record into table.
    INSERT INTO students VALUES (insid, marks, sname);
    -- Return students
    SELECT * FROM students WHERE Rno = insid;
END //

DELIMITER ;

drop procedure insert_proc;
call insert_proc(7,3,'shubham');

select * from students;