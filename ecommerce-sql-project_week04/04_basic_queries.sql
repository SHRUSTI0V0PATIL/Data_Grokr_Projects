-- ============================================
-- Basic SQL Queries
-- SELECT, WHERE, ORDER BY, LIMIT and Aliases
-- ============================================


-- 1. Select all products
SELECT *
FROM products;


-- 2. Select specific columns
SELECT
    product_name,
    price
FROM products;


-- 3. WHERE - products above ₹1000
SELECT
    product_name,
    price
FROM products
WHERE price > 1000;


-- 4. WHERE with multiple conditions
SELECT
    product_name,
    price,
    stock_quantity
FROM products
WHERE price > 1000
AND stock_quantity > 20;


-- 5. ORDER BY - highest price first
SELECT
    product_name,
    price
FROM products
ORDER BY price DESC;


-- 6. ORDER BY - lowest price first
SELECT
    product_name,
    price
FROM products
ORDER BY price ASC;


-- 7. LIMIT - top 3 expensive products
SELECT
    product_name,
    price
FROM products
ORDER BY price DESC
LIMIT 3;


-- 8. Column aliases
SELECT
    product_name AS product,
    price AS product_price,
    stock_quantity AS available_stock
FROM products;


-- 9. Table alias
SELECT
    p.product_name,
    p.price
FROM products AS p;