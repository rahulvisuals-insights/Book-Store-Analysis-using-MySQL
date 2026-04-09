                                                  -- LEVEL 1: BASIC (Foundation) --
select*from customers;
select*from orders;
select*from books;


-- Retrieve all customers from the dataset?

SELECT 
    *
FROM
    customers;

-- Show all orders with their order dates and total amount?

SELECT 
    Order_id, Total_Amount, Ordermonth
FROM
    orders;

-- List all books available in the dataset?

SELECT 
    *
FROM
    books;

-- Find total number of customers?

SELECT 
    COUNT(customer_id)
FROM
    customers;


-- Find total number of orders?

SELECT 
    COUNT(order_id)
FROM
    orders;

-- Get unique customer IDs from Orders table?

select distinct Customer_ID from orders;

-- Find orders where TotalAmount is greater than 200?

SELECT 
    order_id, Total_amount, customer_id
FROM
    orders
WHERE
    Total_Amount > 200;

-- Sort orders by TotalAmount in descending order?

SELECT 
    *
FROM
    orders
ORDER BY Total_Amount DESC;