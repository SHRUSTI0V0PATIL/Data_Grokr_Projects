
-- Project: ETL SQL Pipeline
-- Step 1: Create schemas and tables

CREATE SCHEMA IF NOT EXISTS etl;
CREATE SCHEMA IF NOT EXISTS warehouse;

-- Staging table for customer CSV data
CREATE TABLE IF NOT EXISTS etl.stg_customers (
    customer_code VARCHAR(20),
    customer_name VARCHAR(100),
    city VARCHAR(100),
    updated_at DATE
);

-- Staging table for sales CSV data
CREATE TABLE IF NOT EXISTS etl.stg_sales (
    sale_id BIGINT,
    customer_code VARCHAR(20),
    sale_date DATE,
    product_name VARCHAR(100),
    quantity INTEGER,
    unit_price NUMERIC(12, 2)
);

-- Customer dimension
CREATE TABLE IF NOT EXISTS warehouse.dim_customer (
    customer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_code VARCHAR(20) NOT NULL UNIQUE,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    source_updated_at DATE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
