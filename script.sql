-- get a list of all order with user and order details
select sum(o.quantity * o.price) as total_amount from order_items o group by o.product_id;

-- find total sales per product
select p.name as product_name,o.quantity as order_quantity,o.price, sum(o.price *o.quantity) as total_sales 
from products p join order_items o 
on p.product_id= o.product_id group by p.product_id,o.quantity,o.price;

-- List All Users with Their Most Recent Order
SELECT u.user_id, u.username, o.order_id, o.order_date
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE o.order_date = (
    SELECT MAX(order_date)
    FROM orders
    WHERE user_id = u.user_id
);

-- Retrieve Products and Their Categories
SELECT p.product_id, p.name AS product_name, c.name AS category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
ORDER BY p.name;

-- Find Users with More Than 2 Orders
SELECT u.user_id, u.username, COUNT(o.order_id) AS order_count
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.username
HAVING COUNT(o.order_id) > 2;

-- List All Orders for a Specific User with Total Amount
SELECT o.order_id, o.order_date, o.total_amount
FROM orders o
WHERE o.user_id = 1
ORDER BY o.order_date DESC;

-- Get Products with high Inventory
SELECT p.product_id, p.name, i.quantity_in_stock
FROM products p
JOIN inventory i ON p.product_id = i.product_id
WHERE i.quantity_in_stock > 60
ORDER BY i.quantity_in_stock;

-- List All Reviews for a Product Ordered by Rating
SELECT r.review_id, r.rating, r.comment, u.username
FROM reviews r
JOIN users u ON r.user_id = u.user_id
WHERE r.product_id = 101
ORDER BY r.rating DESC;

--  Find Users Who Have Not Placed Any Orders
SELECT u.user_id, u.username
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE o.order_id IS NULL;

-- Get Total Sales Amount for Each Product
SELECT p.product_id, p.name, SUM(oi.price * oi.quantity) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY total_sales DESC;

-- 5 most expensive product
SELECT p.product_id, p.name, p.price
FROM products p
ORDER BY p.price DESC
LIMIT 5;

-- List Products with their Average Review Rating and Order By Rating
SELECT p.product_id, p.name, AVG(r.rating) AS average_rating
FROM products p
LEFT JOIN reviews r ON p.product_id = r.product_id
GROUP BY p.product_id, p.name
ORDER BY average_rating DESC;
