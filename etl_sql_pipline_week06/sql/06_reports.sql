
-- Report 1: Total revenue and transactions by month
SELECT
    DATE_TRUNC('month', sale_date)::DATE AS sales_month,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS units_sold,
    SUM(total_amount) AS total_revenue
FROM warehouse.fact_sales
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY sales_month;


-- Report 2: Revenue by customer
SELECT
    c.customer_code,
    c.customer_name,
    c.city,
    COUNT(f.sale_id) AS transactions,
    COALESCE(SUM(f.total_amount), 0) AS total_spent
FROM warehouse.dim_customer AS c
LEFT JOIN warehouse.fact_sales AS f
    ON f.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.customer_code,
    c.customer_name,
    c.city
ORDER BY total_spent DESC;


-- Report 3: Best-selling products by revenue
SELECT
    product_name,
    SUM(quantity) AS units_sold,
    SUM(total_amount) AS total_revenue
FROM warehouse.fact_sales
GROUP BY product_name
ORDER BY total_revenue DESC;


-- Report 4: Revenue by city
SELECT
    c.city,
    SUM(f.total_amount) AS total_revenue
FROM warehouse.fact_sales AS f
JOIN warehouse.dim_customer AS c
    ON c.customer_id = f.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;
