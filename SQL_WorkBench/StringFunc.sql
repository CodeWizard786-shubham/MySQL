# string Functions

# 1. Char length of a string.
select length('Data Engineering using python and Spark') as char_length; 

# 2. concat two string.
select concat('shubham'," ",'shirke') as full_name;
# 3.concat two string with a symbol in between.
select concat_ws('_','Hello','Good','Morning') as new_text;

# 4. Format a string
select concat(Format(0.681*100,2),'%') as percentage;

# 5.find the occurrence of an alphabet.
select ('Data Engineering using python and Spark','e') as Occurences;

# 6. String in lower case
SELECT LCASE('Data Engineering using Python and Spark') as lower_case_string;

# 7. Left string -- SELECT LEFT(String, Index_position);  
select left('Data Engineering using Python and Spark',6) as left_string;

# 8.LAPD String function - adds a symbol at left of the string.
 SELECT LPAD('hello',8,'??') as LAPD; 
 SELECT RPAD('hi',5,'?') as RAPD;  # right padding 
  
# 9. LTRIM(str)
#Returns the string str with leading space characters removed. Returns NULL if str is NULL.
select ltrim('    Data Engineering using Python and Spark');
select rtrim('Data Engineering using Python and Spark             ');

# 10. Repalce Characters from string.
 SELECT REPLACE('www.mysql.com', 'w', 'Ww');
 
# 11. Print substring from specific index.
SELECT SUBSTRING('Data Engineering using Python and Spark',6) as substring;
 