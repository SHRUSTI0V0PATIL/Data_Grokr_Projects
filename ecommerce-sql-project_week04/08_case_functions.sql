-- ============================================
-- CASE WHEN, String Functions and Date/Time
-- ============================================


-- ============================================
-- 1. CASE WHEN
-- Categorize products based on price
-- ============================================

SELECT
    product_name,
    price,
    CASE
        WHEN price >= 3000 THEN 'Expensive'
        WHEN price >= 1000 THEN 'Medium'
        ELSE 'Affordable'
    END AS price_category
FROM products;


-- ============================================
-- 2. CASE WHEN
-- Categorize order status
-- ============================================

SELECT
    order_id,
    status,
    CASE
        WHEN status = 'Delivered' THEN 'Completed'
        WHEN status = 'Cancelled' THEN 'Failed'
        ELSE 'In Progress'
    END AS order_category
FROM orders;


-- ============================================
-- STRING FUNCTIONS
-- ============================================


-- 3. CONCAT - combine first and last name
SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM customers;


-- 4. UPPER - convert product names to uppercase
SELECT
    product_name,
    UPPER(product_name) AS uppercase_name
FROM products;


-- 5. LOWER - convert emails to lowercase
SELECT
    first_name,
    LOWER(email) AS email_lowercase
FROM customers;


-- 6. LENGTH - find product name length
SELECT
    product_name,
    LENGTH(product_name) AS name_length
FROM products;


-- ============================================
-- DATE/TIME FUNCTIONS
-- ============================================


-- 7. Monthly order count
SELECT
    DATE_TRUNC('month', order_date) AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;


-- 8. Orders by date
SELECT
    DATE(order_date) AS order_day,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE(order_date)
ORDER BY order_day;


-- 9. Extract year from order date
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    COUNT(*) AS total_orders
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date);