
-- Step 3: Merge staging customers into the dimension

MERGE INTO warehouse.dim_customer AS target
USING (
    SELECT
        customer_code,
        customer_name,
        city,
        updated_at
    FROM (
        SELECT
            customer_code,
            customer_name,
            city,
            updated_at,
            ROW_NUMBER() OVER (
                PARTITION BY customer_code
                ORDER BY updated_at DESC
            ) AS rn
        FROM etl.stg_customers
        WHERE customer_code IS NOT NULL
          AND customer_name IS NOT NULL
          AND updated_at IS NOT NULL
    ) AS ranked
    WHERE rn = 1
) AS source
ON target.customer_code = source.customer_code

WHEN MATCHED
     AND source.updated_at >= target.source_updated_at
THEN UPDATE SET
    customer_name = source.customer_name,
    city = source.city,
    source_updated_at = source.updated_at

WHEN NOT MATCHED THEN
    INSERT (
        customer_code,
        customer_name,
        city,
        source_updated_at
    )
    VALUES (
        source.customer_code,
        source.customer_name,
        source.city,
        source.updated_at
    );

-- Verify the dimension
SELECT
    customer_id,
    customer_code,
    customer_name,
    city,
    source_updated_at
FROM warehouse.dim_customer
ORDER BY customer_code;
