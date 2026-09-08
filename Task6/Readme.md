# Task 6: Sales Trend Analysis Using Aggregations

**Internship:** Elevate Labs — Data Analyst Internship
**Tool used:** MySQL 8.x

## Objective
Analyze monthly revenue and order volume from an `online_sales` database using SQL aggregate functions and `GROUP BY`.

## What's in this repo
- `task6_sales_trend_analysis.sql` — full script: creates the database and `orders` table, inserts sample data, and runs all the aggregation queries.
- `README.md` — this file.
- (add your query result screenshots here if you want, e.g. `results/monthly_revenue.png`)

## How to run it
1. Install MySQL (Server + Workbench).
2. Open MySQL Workbench, connect to your local instance.
3. Open `task6_sales_trend_analysis.sql` and run the whole script (⚡ Execute).
4. Each `SELECT` below the setup section runs independently — highlight one and hit Ctrl+Enter to run just that query and see its result grid.

## Approach
1. Created an `orders` table with `order_id`, `order_date`, `amount`, `product_id`.
2. Inserted sample data spanning 6 months (Jan–Jun 2024), including one `NULL` amount to test NULL handling.
3. Used `EXTRACT(YEAR/MONTH FROM order_date)` and `DATE_FORMAT(order_date, '%Y-%m')` to bucket orders by month.
4. Used `SUM(amount)` for monthly revenue and `COUNT(DISTINCT order_id)` for order volume.
5. Used `ORDER BY` to sort chronologically, and `ORDER BY revenue DESC LIMIT 3` to find the top 3 months.
6. Used `WHERE order_date BETWEEN ...` to filter to a specific period (Q1 2024).

