                                         -- LEVEL 2: INTERMEDIATE (Real Analysis Starts)


-- Find total revenue generated from all orders

SELECT 
    ROUND(SUM(total_amount)) AS Total_Revenue
FROM
    orders;


-- Find average order value

SELECT 
    AVG(Total_Amount) AS Avg_Order_Value
FROM
    Orders;


-- Count number of orders per customer

SELECT 
    customer_id, COUNT(order_id) AS per_customer_order
FROM
    orders
GROUP BY customer_id;


-- Find top 5 customers based on total spending

SELECT 
    customer_id, SUM(Total_Amount) AS Top_customer
FROM
    orders
GROUP BY customer_id
ORDER BY Top_customer DESC
LIMIT 5;


-- Find best-selling books based on number of orders

select Book_id, count(order_id) as Best_selling from orders
group by book_id 
order by best_selling desc 
limit 7;


-- Find books that have never been ordered

SELECT 
    book_id, COUNT(order_id) AS no_order
FROM
    orders
GROUP BY book_id
HAVING no_order < 1;


-- Find customers who have not placed any orders

select customer_id , count(order_id) as empty_customer from orders
group by customer_id
having empty_customer<1;



-- Calculate total revenue generated per book

SELECT 
    books.title, SUM(orders.total_amount) AS revenue_per_book
FROM
    orders
        JOIN
    books ON orders.Book_ID = books.Book_ID
GROUP BY books.title;


-- Find highest single order value

SELECT 
      MAX(total_amount) AS highest_order_value
FROM
    orders; 
    
    -- or 
    
    SELECT *
FROM Orders
WHERE Total_Amount = (
    SELECT MAX(Total_Amount) FROM Orders
);


-- Find the customer who placed the most orders

SELECT 
    customers.name, COUNT(order_id) AS orders_count
FROM
    orders
        JOIN
    customers ON orders.Customer_ID = customers.Customer_ID
GROUP BY customers.name
ORDER BY orders_count DESC
LIMIT 1;

