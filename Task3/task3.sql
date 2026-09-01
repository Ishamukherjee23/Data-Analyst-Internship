-- SELECT
SELECT * FROM Customers;

-- WHERE
SELECT *
FROM Customers
WHERE country = 'USA';

-- ORDER BY
SELECT *
FROM Orders
ORDER BY amount DESC;

-- GROUP BY
SELECT country, COUNT(*) AS total_customers
FROM Customers
GROUP BY country;

-- INNER JOIN
SELECT
    Customers.first_name,
    Customers.last_name,
    Orders.item,
    Orders.amount
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- SUM
SELECT SUM(amount) AS total_revenue
FROM Orders;

-- AVG
SELECT AVG(amount) AS average_order_amount
FROM Orders;

-- SUBQUERY
SELECT *
FROM Orders
WHERE amount = (
    SELECT MAX(amount)
    FROM Orders
);
