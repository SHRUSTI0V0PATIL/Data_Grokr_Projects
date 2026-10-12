# SQL Dimensional Report

## Project Overview
This project demonstrates SQL-based sales reporting using PostgreSQL and a dimensional data model. It explores analytical queries, ranking functions, monthly sales growth, summary totals, and query optimization.

## Database Design
The database uses a star schema consisting of one central fact table and four dimension tables.

- `fact_sales`: Stores sales transactions, quantities, amounts, and dimension keys.
- `dim_customers`: Stores customer details.
- `dim_products`: Stores product names, categories, and prices.
- `dim_date`: Stores calendar and reporting attributes.
- `dim_regions`: Stores geographical information.

## Concepts Covered
1. Star schema and joins
2. Window functions: `RANK()`, `DENSE_RANK()`, and `ROW_NUMBER()`
3. Common Table Expressions (CTEs)
4. Month-over-Month sales analysis using `LAG()`
5. `ROLLUP` for subtotals and grand totals
6. Query optimization using indexes, `EXPLAIN`, and `EXPLAIN ANALYZE`

## Technologies Used
- PostgreSQL
- SQL
- Visual Studio Code
- pgAdmin 4

## How to Run
1. Create a PostgreSQL database named `sql_dimensional_report`.
2. Execute `01_create_tables.sql`.
3. Execute `02_insert_data.sql` once.
4. Execute the remaining SQL files individually to run the reports and optimization tests.

## Sample Dataset
The project uses fictional sales data consisting of six customers, six products, three regions, six months of calendar dates, and 18 sales transactions.

## Learning Outcome
This project demonstrates relational database design, SQL analytics, sales reporting, window functions, aggregation, and basic query-plan analysis.
