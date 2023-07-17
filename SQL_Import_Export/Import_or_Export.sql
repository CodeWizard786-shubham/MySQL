use studentdb;

# Export
SELECT * INTO OUTFILE 'student1.sql' FROM student;

# Import
LOAD DATA INFILE 'fdata.csv'
INTO TABLE student
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT table_schema, table_name
INTO OUTFILE 'output.sql'
FROM information_schema.tables
WHERE table_schema = 'studentdb'
ORDER BY table_schema, table_name;