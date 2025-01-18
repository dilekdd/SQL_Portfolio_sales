--identify the products sold in all regions (there is none in this dataset!)
-- SELECT 
-- 	item_code
-- FROM sales
-- GROUP BY item_code
-- HAVING COUNT(DISTINCT region) = (SELECT COUNT(DISTINCT region) FROM sales); 

--find the products that were sold in more than one region
SELECT 
	item_code,
	STRING_AGG(DISTINCT region, ',     ') AS regions,
	count(*) as total_count
FROM sales
GROUP BY item_code
HAVING COUNT(DISTINCT region) > 1
ORDER BY total_count DESC;