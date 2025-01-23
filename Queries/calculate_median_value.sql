--Find the median value
SELECT 
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_price) AS median_daily_sales
FROM sales