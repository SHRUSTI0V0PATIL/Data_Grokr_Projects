-- ============================================
-- SQL JOINs
-- INNER JOIN, LEFT JOIN, RIGHT JOIN,
-- FULL OUTER JOIN
-- ============================================


-- 1. INNER JOIN
-- Customers who have placed orders
SELECT
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.status
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;


-- 2. LEFT JOIN
-- Show all customers, including customers
-- who have not placed an order
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.status
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;


-- 3. LEFT JOIN + IS NULL
-- Find customers who have never placed an order
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- 4. RIGHT JOIN
-- Show all products and their order items
SELECT
    p.product_name,
    oi.order_id,
    oi.quantity
FROM order_items oi
RIGHT JOIN products p
    ON oi.product_id = p.product_id;


-- 5. FULL OUTER JOIN
-- Show all customers and orders
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.status
FROM customers c
FULL OUTER JOIN orders o
    ON c.customer_id = o.customer_id;