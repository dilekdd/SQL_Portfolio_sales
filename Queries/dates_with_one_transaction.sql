-- dates where exactly one transaction occurred (date and customer name)
SELECT 
	DATE_TRUNC('day', date_ ) AS truncated_date,
	STRING_AGG(DISTINCT customer_name, ',     ') AS customer_name
FROM sales
GROUP BY DATE_TRUNC('day', date_ )
HAVING count(*) = 1
ORDER BY truncated_date;