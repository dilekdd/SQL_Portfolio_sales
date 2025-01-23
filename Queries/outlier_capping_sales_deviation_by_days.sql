--Identify days with total sales deviating significantly (greater than 1.5x or less than 0.5x) from the average daily sales, 
-- after capping outliers by including only rows where total sales fall between the 25th and 75th percentiles.
WITH Percentiles AS (
    SELECT 
        ROUND(CAST(PERCENTILE_CONT(0.05) WITHIN GROUP (ORDER BY total_price) AS INT), 2) AS p05,
        ROUND(CAST(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY total_price) AS INT), 2) AS p95
    FROM sales
),
CappedSales AS (
    SELECT *
    FROM sales
    WHERE total_price BETWEEN 
        (SELECT p05 FROM Percentiles) AND 
        (SELECT p95 FROM Percentiles)
),
AvgDailySales AS (
    SELECT 
        ROUND(AVG(total_price), 2) AS avg_sales
    FROM CappedSales
)
SELECT
    DATE_TRUNC('day', date_) AS truncated_date,
    total_price
FROM CappedSales, AvgDailySales
WHERE total_price > (SELECT avg_sales FROM AvgDailySales) * 1.5
   OR total_price < (SELECT avg_sales FROM AvgDailySales) * 0.5
ORDER BY total_price DESC;