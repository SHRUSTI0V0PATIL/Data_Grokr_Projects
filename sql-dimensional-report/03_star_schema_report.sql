
-- Project: SQL Dimensional Report
-- Step 3: Star Schema Sales Report

SELECT
    s.sales_id,
    d.full_date AS sale_date,
    d.month_name,
    d.year_number,
    c.customer_name,
    c.city,
    p.product_name,
    p.category,
    r.region_name,
    s.quantity,
    p.unit_price,
    s.sales_amount
FROM fact_sales AS s
INNER JOIN dim_date AS d
    ON s.date_id = d.date_id
INNER JOIN dim_customers AS c
    ON s.customer_id = c.customer_id
INNER JOIN dim_products AS p
    ON s.product_id = p.product_id
INNER JOIN dim_regions AS r
    ON s.region_id = r.region_id
ORDER BY d.full_date, s.sales_id;



-- Sales summary by product category

SELECT
    p.category,
    COUNT(*) AS number_of_transactions,
    SUM(s.quantity) AS total_units_sold,
    SUM(s.sales_amount) AS total_sales,
    ROUND(AVG(s.sales_amount), 2) AS average_sale
FROM fact_sales AS s
INNER JOIN dim_products AS p
    ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;
