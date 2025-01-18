-- Calculate the total of Top 10% Customers' total spent
WITH CustomerSpending AS (
 SELECT customer_code, SUM(total_price) AS total_spent
 FROM sales
 GROUP BY customer_code
),
TopCustomers AS (
 SELECT customer_code, total_spent,
 PERCENT_RANK() OVER (ORDER BY total_spent DESC) AS
percentile
 FROM CustomerSpending
)
SELECT SUM(total_spent) AS top_10_percent_total_sales
FROM TopCustomers
WHERE percentile <= 0.1;