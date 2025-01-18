-- Calculate Top 10% Customers' total spent (Top %10 customers' customer_code, customer_name, total_spent)
WITH CustomerSpending AS (
 SELECT customer_code, customer_name, SUM(total_price) AS total_spent
 FROM sales
 GROUP BY customer_code, customer_name
),
TopCustomers AS (
 SELECT customer_code, customer_name, total_spent,
 PERCENT_RANK() OVER (ORDER BY total_spent DESC) AS
percentile
 FROM CustomerSpending
)
SELECT customer_code, customer_name, total_spent
FROM TopCustomers
WHERE percentile <= 0.1;