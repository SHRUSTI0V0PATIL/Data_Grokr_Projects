
-- Step 4: Create a monthly partitioned fact table

CREATE TABLE IF NOT EXISTS warehouse.fact_sales (
    sale_id BIGINT NOT NULL,
    sale_date DATE NOT NULL,
    customer_id INTEGER NOT NULL
        REFERENCES warehouse.dim_customer(customer_id),
    product_name VARCHAR(100) NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(12, 2) NOT NULL
        CHECK (unit_price >= 0),
    total_amount NUMERIC(14, 2)
        GENERATED ALWAYS AS (quantity * unit_price) STORED,
    PRIMARY KEY (sale_id, sale_date)
)
PARTITION BY RANGE (sale_date);

-- January 2026
CREATE TABLE IF NOT EXISTS warehouse.fact_sales_2026_01
PARTITION OF warehouse.fact_sales
FOR VALUES FROM ('2026-01-01') TO ('2026-02-01');

-- February 2026
CREATE TABLE IF NOT EXISTS warehouse.fact_sales_2026_02
PARTITION OF warehouse.fact_sales
FOR VALUES FROM ('2026-02-01') TO ('2026-03-01');

-- March 2026
CREATE TABLE IF NOT EXISTS warehouse.fact_sales_2026_03
PARTITION OF warehouse.fact_sales
FOR VALUES FROM ('2026-03-01') TO ('2026-04-01');

-- Indexes for common report queries
CREATE INDEX IF NOT EXISTS idx_fact_sales_customer
ON warehouse.fact_sales (customer_id);

CREATE INDEX IF NOT EXISTS idx_fact_sales_product
ON warehouse.fact_sales (product_name);
