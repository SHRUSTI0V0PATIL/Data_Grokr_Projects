
-- Project: SQL Dimensional Report
-- Step 4: Window Function Rankings

WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        p.category,
        SUM(s.sales_amount) AS total_sales
    FROM dim_products AS p
    INNER JOIN fact_sales AS s
        ON p.product_id = s.product_id
    GROUP BY
        p.product_id,
        p.product_name,
        p.category
)
SELECT
    product_name,
    category,
    total_sales,

    RANK() OVER (
        ORDER BY total_sales DESC
    ) AS sales_rank,

    DENSE_RANK() OVER (
        ORDER BY total_sales DESC
    ) AS dense_sales_rank,

    ROW_NUMBER() OVER (
        ORDER BY total_sales DESC, product_name
    ) AS row_number

FROM product_sales
ORDER BY total_sales DESC, product_name;



-- Rank products within each category

WITH product_sales AS (
    SELECT
        p.product_name,
        p.category,
        SUM(s.sales_amount) AS total_sales
    FROM dim_products AS p
    INNER JOIN fact_sales AS s
        ON p.product_id = s.product_id
    GROUP BY p.product_name, p.category
)
SELECT
    product_name,
    category,
    total_sales,
    DENSE_RANK() OVER (
        PARTITION BY category
        ORDER BY total_sales DESC
    ) AS category_rank
FROM product_sales
ORDER BY category, category_rank, product_name;
