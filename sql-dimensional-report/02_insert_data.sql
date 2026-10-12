
-- Project: SQL Dimensional Report
-- Step 2: Insert dimension and sales data

-- 1. Insert customers
INSERT INTO dim_customers
    (customer_name, city, customer_type)
VALUES
    ('Aarav Sharma', 'Bengaluru', 'Regular'),
    ('Priya Patel', 'Mumbai', 'Premium'),
    ('Rahul Verma', 'Delhi', 'Regular'),
    ('Ananya Rao', 'Chennai', 'Premium'),
    ('Kiran Kumar', 'Hyderabad', 'Regular'),
    ('Sneha Iyer', 'Pune', 'Premium');

-- 2. Insert products
INSERT INTO dim_products
    (product_name, category, unit_price)
VALUES
    ('Laptop', 'Electronics', 55000.00),
    ('Smartphone', 'Electronics', 25000.00),
    ('Office Chair', 'Furniture', 8000.00),
    ('Desk', 'Furniture', 12000.00),
    ('Notebook Pack', 'Stationery', 200.00),
    ('Pen Pack', 'Stationery', 100.00);

-- 3. Insert dates from January to June 2026
INSERT INTO dim_date
    (date_id, full_date, day_number, month_number,
     month_name, quarter_number, year_number)
SELECT
    TO_CHAR(d::DATE, 'YYYYMMDD')::INT,
    d::DATE,
    EXTRACT(DAY FROM d)::INT,
    EXTRACT(MONTH FROM d)::INT,
    TO_CHAR(d, 'FMMonth'),
    EXTRACT(QUARTER FROM d)::INT,
    EXTRACT(YEAR FROM d)::INT
FROM GENERATE_SERIES(
    DATE '2026-01-01',
    DATE '2026-06-30',
    INTERVAL '1 day'
) AS dates(d);

-- 4. Insert regions
INSERT INTO dim_regions (region_name, country)
VALUES
    ('South India', 'India'),
    ('West India', 'India'),
    ('North India', 'India');

-- 5. Insert sales transactions
-- Each transaction links to a date, customer, product and region.

INSERT INTO fact_sales
    (date_id, customer_id, product_id, region_id,
     quantity, sales_amount)
VALUES
    (20260105, 1, 1, 1, 1, 55000.00),
    (20260112, 2, 2, 2, 2, 50000.00),
    (20260120, 3, 3, 3, 3, 24000.00),
    (20260203, 4, 4, 1, 2, 24000.00),
    (20260214, 5, 5, 1, 10, 2000.00),
    (20260222, 6, 6, 2, 20, 2000.00),
    (20260302, 1, 2, 1, 1, 25000.00),
    (20260311, 2, 1, 2, 1, 55000.00),
    (20260319, 3, 4, 3, 3, 36000.00),
    (20260404, 4, 3, 1, 2, 16000.00),
    (20260413, 5, 1, 2, 1, 55000.00),
    (20260425, 6, 5, 2, 15, 3000.00),
    (20260506, 1, 4, 1, 2, 24000.00),
    (20260516, 2, 3, 2, 4, 32000.00),
    (20260524, 3, 2, 3, 2, 50000.00),
    (20260603, 4, 1, 1, 2, 110000.00),
    (20260612, 5, 6, 3, 30, 3000.00),
    (20260623, 6, 2, 2, 3, 75000.00);
