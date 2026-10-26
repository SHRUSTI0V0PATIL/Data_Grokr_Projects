
# ETL SQL Pipeline

## Project Overview
A mini data-engineering project built with PostgreSQL and SQL.
It demonstrates customer dimension merging, CSV ingestion,
monthly table partitioning, reporting, and query-plan analysis.

## Objectives
- Load CSV data using PostgreSQL COPY.
- Create staging and warehouse tables.
- Use MERGE to insert and update customer records.
- Store sales in monthly range partitions.
- Generate business reports using SQL.
- Inspect query execution using EXPLAIN ANALYZE.
- Validate data quality and prevent duplicate transactions.

## Technologies
- PostgreSQL
- SQL
- Visual Studio Code
- pgAdmin 4
- CSV

## Project Structure
- data/: Sample input CSV files
- sql/: SQL scripts for the complete pipeline

## Pipeline Execution Order
1. 01_create_tables.sql
2. 02_load_staging.sql
3. 03_merge_dimension.sql
4. 04_create_partitions.sql
5. 05_load_sales.sql
6. 06_reports.sql
7. 07_explain.sql
8. 08_validation.sql

## Database Design
- etl.stg_customers: Raw customer records
- etl.stg_sales: Raw sales transactions
- warehouse.dim_customer: Customer dimension
- warehouse.fact_sales: Partitioned sales fact table

## Key Concepts
- ETL data pipeline
- COPY FROM CSV
- MERGE statements
- Star-schema concepts
- Range partitioning
- Constraints and indexes
- EXPLAIN ANALYZE
- Data validation

## Dataset
The project uses small, synthetic sample datasets
for demonstration and educational purposes.

## Expected Results
- 7 unique customers
- 12 sales transactions
- 3 monthly sales partitions
- Monthly revenue and customer reports
- Execution plans for selected queries
- No duplicate transaction keys
