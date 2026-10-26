
-- Check 1: Unique customer count
SELECT COUNT(*) AS customer_count
FROM warehouse.dim_customer;

-- Check 2: Sales transaction count
SELECT COUNT(*) AS sales_count
FROM warehouse.fact_sales;

-- Check 3: Check for duplicate sales keys
SELECT
    sale_id,
    sale_date,
    COUNT(*) AS duplicate_count
FROM warehouse.fact_sales
GROUP BY sale_id, sale_date
HAVING COUNT(*) > 1;

-- Check 4: Find sales without a matching customer
SELECT s.*
FROM etl.stg_sales AS s
LEFT JOIN warehouse.dim_customer AS c
    ON c.customer_code = s.customer_code
WHERE c.customer_id IS NULL;

-- Check 5: Verify monthly partition counts
SELECT
    tableoid::REGCLASS AS partition_name,
    COUNT(*) AS sales_count,
    SUM(total_amount) AS revenue
FROM warehouse.fact_sales
GROUP BY tableoid
ORDER BY partition_name;

-- Check 6: Total revenue
SELECT SUM(total_amount) AS overall_revenue
FROM warehouse.fact_sales;
