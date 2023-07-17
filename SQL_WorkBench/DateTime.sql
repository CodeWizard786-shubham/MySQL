create database sales;

use sales;
-- Create Customers table

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com'),
    (3, 'Mike', 'Johnson', 'mike.johnson@example.com'),
    (4, 'Emily', 'Brown', 'emily.brown@example.com');

-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2023-01-01', 100.00),
    (2, 1, '2023-02-15', 50.00),
    (3, 2, '2023-03-10', 200.00),
    (4, 3, '2023-04-20', 150.00),
    (5, 4, '2023-06-05', 75.00);
    
# Get current system data and time
select now() as current_date_time;

# Get current system date
select curdate() as system_date;

# Get current system time
select curtime() as system_time;

# Get only year from date
select year(OrderDate) from Orders;

# Get only day from date
select day(OrderDate) from Orders;

# get only date from given date time
SELECT DATE ("2021-10-24 18:28:44") AS SHOW_DATE;  

# get only hour from given time
SELECT HOUR("19:10:43") AS SHOW_HOUR;  

# Adding days to existing dates.
select date_add(OrderDate, interval 15 day) as Order_Datez from orders;
# adding column shipping date
Alter table Orders add column Shipping_date date;
# updating column shipping date for values same as shipping date.
update Orders set Shipping_date=OrderDate where Orderid in (1,2,3,4); 

select date_add(OrderDate, interval 5 month) as Order_Date from Orders;

update Orders set OrderDate=date_sub(Shipping_date,interval 5 month) where Orderid in (1,2,3,4);

select * from Orders;

commit;

select datediff(Shipping_date,OrderDate) from orders;
# Fomrat Date to print in specific type
SELECT DATE_FORMAT (Shipping_date, "%W %D %M %Y") AS Formatted_Date from orders;  








