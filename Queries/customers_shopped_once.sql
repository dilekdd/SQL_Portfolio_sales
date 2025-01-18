-- find the customers that shopped once
SELECT 
	customer_code,
	customer_name,
	count(*) as total_shop
FROM sales
GROUP BY customer_code, customer_name
HAVING count(*) = 1
ORDER BY  customer_name;
