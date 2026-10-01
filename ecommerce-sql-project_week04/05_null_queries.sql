-- ============================================
-- NULL Handling
-- IS NULL, COALESCE and NULLIF
-- ============================================


-- 1. Find customers without a phone number
SELECT
    first_name,
    last_name,
    phone
FROM customers
WHERE phone IS NULL;


-- 2. Replace NULL phone numbers
SELECT
    first_name,
    COALESCE(phone, 'Not Provided') AS phone
FROM customers;


-- 3. Replace NULL cities
SELECT
    first_name,
    COALESCE(city, 'Unknown City') AS city
FROM customers;


-- 4. NULLIF when both values are equal
SELECT
    NULLIF(10, 10) AS result;


-- 5. NULLIF when values are different
SELECT
    NULLIF(10, 5) AS result;


-- 6. NULLIF with product stock
SELECT
    product_name,
    NULLIF(stock_quantity, 0) AS stock_if_available
FROM products;