-- use studentdb;
-- show tables;

DELIMITER //
CREATE PROCEDURE studentlist(IN sid INT)
BEGIN
    SELECT * FROM student WHERE id = sid;
END // 
DELIMITER ;

CALL studentlist(2);
