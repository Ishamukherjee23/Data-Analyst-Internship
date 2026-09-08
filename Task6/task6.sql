
CREATE DATABASE IF NOT EXISTS online_sales;
USE online_sales;


DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id    INT AUTO_INCREMENT PRIMARY KEY,
    order_date  DATE,
    amount      DECIMAL(10,2),
    product_id  INT
);


INSERT INTO orders (order_date, amount, product_id) VALUES
('2024-01-05', 1200.00, 101),
('2024-01-12',  850.50, 102),
('2024-01-18',  430.00, 103),
('2024-01-25', 1600.75, 101),
('2024-02-02',  990.00, 104),
('2024-02-09', 1150.25, 102),
('2024-02-15',  700.00, 105),
('2024-02-21', 1320.40, 101),
('2024-02-27',  560.60, 103),
('2024-03-03', 2100.00, 106),
('2024-03-10', 1740.30, 102),
('2024-03-17',  980.00, 104),
('2024-03-24', 1290.90, 101),
('2024-03-30',  610.00, 105),
('2024-04-04', 1450.00, 103),
('2024-04-11',  875.20, 102),
('2024-04-19', 1980.00, 106),
('2024-04-26', 1105.60, 101),
('2024-05-01', 2340.00, 104),
('2024-05-08', 1670.00, 102),
('2024-05-14',  920.75, 105),
('2024-05-22', 1580.30, 101),
('2024-05-29', NULL,    103),   -- NULL amount to test NULL handling
('2024-06-03', 2510.00, 106),
('2024-06-10', 1890.40, 102),
('2024-06-17', 1120.00, 104),
('2024-06-24', 1750.90, 101),
('2024-06-28',  640.00, 105);


SELECT
    EXTRACT(YEAR  FROM order_date) AS sales_year,
    EXTRACT(MONTH FROM order_date) AS sales_month,
    SUM(amount)                    AS total_revenue,
    COUNT(DISTINCT order_id)       AS order_volume
FROM orders
GROUP BY sales_year, sales_month
ORDER BY sales_year, sales_month;


SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS year__month,
    SUM(amount)                      AS total_revenue,
    COUNT(DISTINCT order_id)         AS order_volume
FROM orders
GROUP BY year__month
ORDER BY year__month;

-- 3c. Top 3 months by total revenue
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS year_mmonth,
    SUM(amount)                      AS total_revenue
FROM orders
GROUP BY year_mmonth
ORDER BY total_revenue DESC
LIMIT 3;

-- 3d. Revenue and volume for a specific period only (e.g. Q1 2024)
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS year__month,
    SUM(amount)                      AS total_revenue,
    COUNT(DISTINCT order_id)         AS order_volume
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY year__month
ORDER BY year__month;
SELECT
    COUNT(*)                      AS total_rows,
    COUNT(amount)                 AS non_null_amount_rows,
    SUM(amount)                   AS total_revenue_ignoring_nulls,
    SUM(IFNULL(amount, 0))        AS total_revenue_null_as_zero
FROM orders;

SELECT
    COUNT(*)                       AS all_rows,
    COUNT(DISTINCT order_id)       AS distinct_orders,
    COUNT(DISTINCT product_id)     AS distinct_products_sold
FROM orders;