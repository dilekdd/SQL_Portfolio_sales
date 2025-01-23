--find Days with Sales Deviating Significantly from MEDIAN

-- 1st way
WITH MedianSales AS (
    SELECT 
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_price) AS median_sales
    FROM sales
)
SELECT
    DATE_TRUNC('day', date_) AS truncated_date,
    total_price
FROM sales, MedianSales
WHERE total_price > (SELECT median_sales FROM MedianSales) * 1.5
   OR total_price < (SELECT median_sales FROM MedianSales) * 0.5
ORDER BY total_price DESC;



-- 2nd way 
WITH MedianSales AS (
    SELECT 
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_price) AS median_sales
    FROM sales
)
SELECT
    DATE_TRUNC('day', date_) AS truncated_date,
    total_price
FROM sales
CROSS JOIN MedianSales
WHERE total_price > median_sales * 1.5
   OR total_price < median_sales * 0.5
ORDER BY total_price DESC;