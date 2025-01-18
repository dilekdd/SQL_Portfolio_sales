-- Calculate Top 10% Customers' total spent by region (Top %10 customers' customer_code, customer_name, total_spent)
WITH CustomerSpending AS (
 SELECT customer_code, customer_name, region, SUM(total_price) AS total_spent
 FROM sales
 GROUP BY customer_code, customer_name, region
),
TopCustomers AS (
 SELECT customer_code, customer_name, region, total_spent,
 PERCENT_RANK() OVER (PARTITION BY region ORDER BY total_spent DESC) AS
percentile
 FROM CustomerSpending
)
SELECT customer_code, customer_name, region, total_spent
FROM TopCustomers
WHERE percentile <= 0.1;