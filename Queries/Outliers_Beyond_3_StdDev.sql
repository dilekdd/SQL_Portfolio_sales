-- Calculate sales amounts that are more than 3 standard deviations from the mean (outliers)
WITH sales_stats AS (
    SELECT 
        ROUND(AVG(total_price), 2) AS avg_price, ROUND(STDDEV(total_price), 2) AS stddev_price
    FROM sales
)
SELECT item_code, item_name, total_price, avg_price, stddev_price, (3 * stddev_price) AS threshold
FROM sales 
CROSS JOIN sales_stats
WHERE ABS(total_price - avg_price) > 3 * stddev_price;