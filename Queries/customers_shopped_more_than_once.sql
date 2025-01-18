-- list the customers that shopped more than once (customer_name, customer_code, total shopping count)
SELECT 
	customer_code,
	customer_name,
	count(*) as shopping_count
FROM sales
GROUP BY customer_code, customer_name
HAVING count(*) > 1
ORDER BY  shopping_count DESC;