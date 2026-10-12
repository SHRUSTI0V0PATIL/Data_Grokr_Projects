
-- Project: SQL Dimensional Report
-- Step 7: Query Optimization

-- Test 1: Check query performance before adding an index

EXPLAIN ANALYZE
SELECT
    p.category,
    SUM(s.sales_amount) AS total_sales
FROM fact_sales AS s
INNER JOIN dim_products AS p
    ON s.product_id = p.product_id
INNER JOIN dim_date AS d
    ON s.date_id = d.date_id
WHERE d.full_date BETWEEN DATE '2026-01-01'
                      AND DATE '2026-03-31'
GROUP BY p.category;


-- Test 2: Create indexes on frequently used columns

CREATE INDEX IF NOT EXISTS idx_fact_sales_date_id
    ON fact_sales(date_id);

CREATE INDEX IF NOT EXISTS idx_fact_sales_product_id
    ON fact_sales(product_id);

CREATE INDEX IF NOT EXISTS idx_fact_sales_customer_id
    ON fact_sales(customer_id);

-- Update table statistics for the query planner
ANALYZE fact_sales;
