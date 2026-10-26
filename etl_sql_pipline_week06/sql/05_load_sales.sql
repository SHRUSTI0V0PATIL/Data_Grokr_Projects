
-- Step 5: Load sales from staging into the fact table

INSERT INTO warehouse.fact_sales (
    sale_id,
    sale_date,
    customer_id,
    product_name,
    quantity,
    unit_price
)
SELECT
    s.sale_id,
    s.sale_date,
    c.customer_id,
    s.product_name,
    s.quantity,
    s.unit_price
FROM etl.stg_sales AS s
JOIN warehouse.dim_customer AS c
    ON c.customer_code = s.customer_code
WHERE s.sale_id IS NOT NULL
  AND s.sale_date IS NOT NULL
  AND s.product_name IS NOT NULL
  AND s.quantity > 0
  AND s.unit_price >= 0
ON CONFLICT (sale_id, sale_date)
DO UPDATE SET
    customer_id = EXCLUDED.customer_id,
    product_name = EXCLUDED.product_name,
    quantity = EXCLUDED.quantity,
    unit_price = EXCLUDED.unit_price;

-- Verify the loaded sales
SELECT
    sale_id,
    sale_date,
    customer_id,
    product_name,
    quantity,
    unit_price,
    total_amount
FROM warehouse.fact_sales
ORDER BY sale_date, sale_id;
