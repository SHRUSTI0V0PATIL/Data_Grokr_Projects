-- ============================================
-- Aggregate Functions
-- COUNT, SUM, AVG, GROUP BY and HAVING
-- ============================================


-- 1. COUNT - total customers
SELECT
    COUNT(*) AS total_customers
FROM customers;


-- 2. COUNT - total products
SELECT
    COUNT(*) AS total_products
FROM products;


-- 3. SUM - total sales value
SELECT
    SUM(quantity * unit_price) AS total_sales
FROM order_items;


-- 4. AVG - average product price
SELECT
    AVG(price) AS average_product_price
FROM products;


-- 5. GROUP BY - revenue by product ID
SELECT
    product_id,
    SUM(quantity * unit_price) AS revenue
FROM order_items
GROUP BY product_id;


-- 6. GROUP BY - revenue by product name
SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;


-- 7. HAVING - products with revenue above ₹2000
SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(oi.quantity * oi.unit_price) > 2000
ORDER BY revenue DESC;