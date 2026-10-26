
-- Step 2: Clear staging tables before a fresh load
TRUNCATE TABLE etl.stg_customers;
TRUNCATE TABLE etl.stg_sales;

-- Load customer CSV
COPY etl.stg_customers
    (customer_code, customer_name, city, updated_at)
FROM 'C:/Users/shrus/OneDrive/Desktop/etl_sql_pipline/data/customers.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    ENCODING 'UTF8'
);

-- Load sales CSV
COPY etl.stg_sales
    (sale_id, customer_code, sale_date, product_name,
     quantity, unit_price)
FROM 'C:/Users/shrus/OneDrive/Desktop/etl_sql_pipline/data/sales.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    ENCODING 'UTF8'
);

-- Confirm the number of imported records
SELECT 'customers' AS source, COUNT(*) AS records
FROM etl.stg_customers

UNION ALL

SELECT 'sales' AS source, COUNT(*) AS records
FROM etl.stg_sales;
