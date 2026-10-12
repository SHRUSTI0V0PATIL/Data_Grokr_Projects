
-- Project: SQL Dimensional Report
-- Step 1: Create dimension tables

CREATE TABLE dim_customers (
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    customer_type VARCHAR(50)
);

CREATE TABLE dim_products (
    product_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price NUMERIC(10, 2) NOT NULL CHECK (unit_price >= 0)
);

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL UNIQUE,
    day_number INT NOT NULL,
    month_number INT NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    quarter_number INT NOT NULL,
    year_number INT NOT NULL
);

CREATE TABLE dim_regions (
    region_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    region_name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

-- Step 2: Create the central sales fact table

CREATE TABLE fact_sales (
    sales_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date_id INT NOT NULL REFERENCES dim_date(date_id),
    customer_id INT NOT NULL REFERENCES dim_customers(customer_id),
    product_id INT NOT NULL REFERENCES dim_products(product_id),
    region_id INT NOT NULL REFERENCES dim_regions(region_id),
    quantity INT NOT NULL CHECK (quantity > 0),
    sales_amount NUMERIC(12, 2) NOT NULL CHECK (sales_amount >= 0)
);
