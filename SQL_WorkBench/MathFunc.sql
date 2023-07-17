# Math sqL Functions

# 1 . ABS() -getting abstract values.
select abs(-12.45) as abs1 , abs(12.45) as abs2;

# 2 . ACOS() - getting cosine angle in radian value in float.
select acos(0.45) as cosine1,acos(-0.45) as cosine2;

# 2 . ASIN() - getting sine angle in radian value in float. value should be between -1 to 1.
SELECT ASIN(-0.5) AS Result1, ASIN(0.8) AS Result2;  

# 3. CEILING() function that accept numeric values and display the next highest value in integer:
select ceiling(12.34) as Result1,ceil(-22.98) as Result2;

# 4. FLOOR() function that accepts numeric values and displays the next lowest value in integer:
SELECT FLOOR(15) AS Result1,FLOOR(22.19) AS Result2,FLOOR(-20.15) AS Result3;

# 5.  RAND() function that accepts numeric values and displays the random float value between 0 and 1.
select rand(1) as Random1, rand(-3) as Random2; 

# 6. POWER() function and display the value of given expression to the specified power:
SELECT POWER(5,2) AS Result1, POWER(-4,5) AS Result2, POWER(0.8,3) AS Result3;  

# 7. LOG() function and displays the natural logarithm of the given float expression. Its return type is float. 
#If we specify the negative value, it returns an error message.
SELECT LOG(3) AS Result1,LOG(5) AS Result2,LOG(100) AS Result3;  

# 8. SQRT() function that accepts numeric values and displays the square root value:
select sqrt(25) as Square_Root1, sqrt(34) as SquareRoot2;

# 9. PI function. we can use pi function anywhere to use pi value.
SELECT PI();

# 10. ROUND() function is used to round a value to the nearest specified decimal place.
select round(23.453,2) as Round_value;

# 11. Min() function is used to find mininum value.
select min(age) from employeedb;

# 12. Max() function is used to find maximum value.
select max(age) from employeedb;
