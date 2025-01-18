--List the customers who made purchases on dates when multiple customers shopped on the same day
WITH duplicated_date AS (
	SELECT 
		DATE_TRUNC('day', date_ ) AS truncated_date
	FROM sales
	GROUP BY DATE_TRUNC('day', date_ )
	HAVING count(*) > 1
)
SELECT
	DATE_TRUNC('day', date_ ) as date_,
	customer_code,
	customer_name
FROM sales
WHERE DATE_TRUNC('day', date_) IN (SELECT truncated_date FROM duplicated_date)
GROUP BY DATE_TRUNC('day', date_), customer_code, customer_name
ORDER BY date_, customer_code, customer_name;