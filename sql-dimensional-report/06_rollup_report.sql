
-- Project: SQL Dimensional Report
-- Step 6: Sales Summary Using ROLLUP

SELECT
    CASE
        WHEN GROUPING(p.category) = 1
            THEN 'GRAND TOTAL'
        ELSE p.category
    END AS category,

    COUNT(s.sales_id) AS number_of_transactions,
    SUM(s.quantity) AS total_units_sold,
    SUM(s.sales_amount) AS total_sales

FROM fact_sales AS s

INNER JOIN dim_products AS p
    ON s.product_id = p.product_id

GROUP BY ROLLUP(p.category)

ORDER BY
    GROUPING(p.category),
    p.category;



-- Sales totals by category and region,
-- with subtotals and a grand total

SELECT
    CASE
        WHEN GROUPING(p.category) = 1
            THEN 'ALL CATEGORIES'
        ELSE p.category
    END AS category,

    CASE
        WHEN GROUPING(r.region_name) = 1
            THEN 'ALL REGIONS'
        ELSE r.region_name
    END AS region,

    SUM(s.sales_amount) AS total_sales

FROM fact_sales AS s

INNER JOIN dim_products AS p
    ON s.product_id = p.product_id

INNER JOIN dim_regions AS r
    ON s.region_id = r.region_id

GROUP BY ROLLUP(p.category, r.region_name)

ORDER BY
    GROUPING(p.category),
    p.category,
    GROUPING(r.region_name),
    r.region_name;
