-- find products (and count) sold in 'Marmara' region
SELECT
	item_code,
	SUM(amount) AS product_count
FROM sales
WHERE region  LIKE 'Marmara'
GROUP BY item_code
ORDER BY product_count DESC;