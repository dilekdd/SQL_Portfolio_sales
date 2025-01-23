--Find the data distribution
SELECT 
    ROUND(MIN(total_price), 2) AS min_price,
    ROUND(MAX(total_price), 2) AS max_price,
    ROUND(AVG(total_price), 2) AS mean_price,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_price) AS median_price,
    ROUND(STDDEV(total_price), 2) AS std_dev
FROM sales;