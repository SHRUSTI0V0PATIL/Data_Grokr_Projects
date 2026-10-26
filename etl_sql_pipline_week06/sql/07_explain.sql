
-- Step 7: Analyze the sales query

ANALYZE warehouse.fact_sales;

-- Query 1: Inspect a monthly sales query
EXPLAIN
SELECT
    sale_id,
    sale_date,
    product_name,
    total_amount
FROM warehouse.fact_sales
WHERE sale_date >= DATE '2026-02-01'
  AND sale_date < DATE '2026-03-01';

-- Query 2: Execute and measure the monthly query
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    sale_id,
    sale_date,
    product_name,
    total_amount
FROM warehouse.fact_sales
WHERE sale_date >= DATE '2026-02-01'
  AND sale_date < DATE '2026-03-01';

-- Query 3: Inspect a customer-based report
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    customer_id,
    SUM(total_amount) AS revenue
FROM warehouse.fact_sales
WHERE sale_date >= DATE '2026-01-01'
  AND sale_date < DATE '2026-04-01'
GROUP BY customer_id;

-- Query 4: Inspect the partition boundaries
SELECT
    parent.relname AS partitioned_table,
    child.relname AS partition_name
FROM pg_inherits
JOIN pg_class parent
    ON pg_inherits.inhparent = parent.oid
JOIN pg_class child
    ON pg_inherits.inhrelid = child.oid
WHERE parent.relname = 'fact_sales'
ORDER BY child.relname;
