
# create table
create database bridgelabs;
# use database
use bridgelabs;
create table cfp(id int(10) auto_increment PRIMARY KEY,name varchar(20),batch_name varchar(30));
# insert data into table
insert into cfp(id,name,batch_name)values(1,'shubham','Data Engg');
insert into cfp(name,batch_name)values('shreaysh','Data Engg');
insert into cfp(name,batch_name)values('Pankaj','DOT NET');

#Alter table
ALTER TABLE cfp ADD batch_start_date date;
ALTER TABLE cfp RENAME TO cfp_bl;

# Rename column
ALTER TABLE cfp_bl RENAME COLUMN name TO candidate_name;

# DDl commands
select * from cfp_bl;

# Truncate - delete the structure 
truncate table cfp_bl;

# Drop table
drop table cfp_bl;




