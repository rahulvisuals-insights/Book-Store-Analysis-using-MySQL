										 -- Database Creation & Import Data --

create database BookStore;
use BookStore;
select*from customers;
select*from orders;
select*from books;

                                         -- DATA UNDERSTANDING & NULL COLUMNS CHECKING

select * from customers
where name is null or
email is  null 
or phone is null
or city is null
or country is null;

select * from orders
where customer_id is null
or book_id is null
or order_date is null
or quantity is null
or Total_Amount is null;

select * from books
where title is null or
author is null or
genre is null or
published_year is null or
price is null or
stock is null;

                                      -- Check Datatype for Better Analysis

show columns from orders;
show columns from books;
show columns from customers;

                                  -- Convert order_date datatype text to date type --
SET SQL_SAFE_UPDATES = 0;

show columns from orders;

alter table orders add OrderDate date;

update orders
set orderdate = str_to_date(order_date, '%Y-%m-%d');

alter table orders drop order_date;

                                      -- Add Month column in orders table

alter table orders add  OrderMonth varchar(10);

update orders
set OrderMonth = monthname(orderdate);


											-- EDA(DATA EXPLORATION ANALYSIS) --
                                            
                                                     -- Basic Matrix --
                                                   
                                                     -- TOTAL REVENUE --

SELECT 
    ROUND(SUM(Total_Amount), 2) AS Total_Revenue
FROM
    ORDERS;
    
                                                       -- TOTAL ORDERS --

SELECT 
    COUNT(order_id) AS Total_Orders
FROM
    orders;
    
														-- TOP CUSTOMER --

SELECT 
    customer_id, SUM(total_amount) AS Total_Spent
FROM
    orders
GROUP BY customer_id
ORDER BY Total_spent DESC
LIMIT 1;

                                                      -- Best Selling Product --

SELECT 
    book_id, SUM(quantity) AS Top_Product
FROM
    orders
GROUP BY book_id
ORDER BY Top_product DESC
LIMIT 1;

                                                          -- Monthly Sales --

SELECT 
    ordermonth, ROUND(SUM(Total_Amount)) AS Monthly_sale
FROM
    orders
GROUP BY ordermonth
ORDER BY Monthly_sale DESC;

                                                           -- Customer Segment --

SELECT Customer_ID,
       round(SUM(Total_Amount)) AS TotalSpent,
       CASE 
           WHEN SUM(Total_Amount) > 500 THEN 'High Value'
           ELSE 'Low Value'
       END AS Segment
FROM Orders
GROUP BY Customer_ID
order by totalspent desc;


                                                   -- Regular Customer vs New Customer --


SELECT 
    Customer_ID,
    COUNT(Order_ID) AS OrdersCount,
    CASE
        WHEN COUNT(Order_ID) = 1 THEN 'New Customer'
        ELSE 'Regular Customer'
    END AS Customer_type
FROM
    Orders
GROUP BY Customer_ID;
