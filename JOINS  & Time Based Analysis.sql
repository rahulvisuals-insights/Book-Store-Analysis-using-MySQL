
                                          -- LEVEL 3: JOINS (MOST IMPORTANT)
select * from orders;
select * from customers;
select * from books;

-- Display customer name with their order details?

SELECT 
    customers.name, orders.*
FROM
    orders
        JOIN
    customers ON customers.customer_id = orders.customer_id;



-- Show book name with corresponding order details?

SELECT 
    books.title, orders.*
FROM
    orders
        JOIN
    books ON orders.book_id = books.book_id;



-- Find total amount spent by each customer (with names)?

SELECT 
    customers.name,
    ROUND(SUM(orders.total_amount)) AS Total_spent
FROM
    orders
        JOIN
    customers ON customers.customer_id = orders.customer_id
GROUP BY customers.name
ORDER BY Total_spent DESC;


-- List all customers along with number of orders (including those with 0 orders)?

SELECT 
    customers.name, COUNT(orders.order_id) AS booked_orders
FROM
    orders
        JOIN
    customers ON orders.customer_id = customers.customer_id
GROUP BY customers.name;


-- Find books along with total sales revenue?

SELECT 
    books.title , sum(orders.total_amount) AS Revenue
FROM
    orders
        JOIN
    books ON orders.book_id = books.book_id
GROUP BY books.title;


-- Find customers who purchased a specific book?



-- Show complete dataset (Customers + Orders + Books combined)?
         
SELECT 
    *
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.customer_id
        JOIN
    books ON books.book_id = orders.book_id;
                                              
                                              
                                              
              
                                                  -- LEVEL 4: TIME-BASED ANALYSIS
select * from orders;
select * from customers;
select * from books;                                                  
                                                  
                                                  
-- Find total sales per month?

SELECT 
    ordermonth, ROUND(SUM(total_amount)) AS Revenue
FROM
    orders
GROUP BY ordermonth
ORDER BY Revenue DESC;


-- Find month with highest revenue?

SELECT 
    ordermonth, SUM(Total_amount) AS Revenue
FROM
    orders
GROUP BY ordermonth
ORDER BY Revenue DESC
LIMIT 1;


-- Count number of orders per month?

SELECT 
    ordermonth, COUNT(order_id)
FROM
    orders
GROUP BY ordermonth;


-- Find daily average sales?

select orderdate , avg(Total_amount) from orders
group by orderdate;

-- Find Monthly average sales

select ordermonth , avg(Total_amount) from orders
group by ordermonth;


-- Identify sales trend (increasing or decreasing month-wise)?

SELECT 
    MONTH(OrderDate) AS Month,
    SUM(Total_Amount) AS Sales
FROM Orders
GROUP BY MONTH(OrderDate)
ORDER BY Month;
