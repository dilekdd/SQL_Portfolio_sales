--Calculate the Median Sales Amount for Each Product
--SELECT DISTINCT item_code FROM sales - OUTPUT 938

SELECT 
    item_name,
    item_code,
    ROUND(
        CAST(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_price) AS NUMERIC),
        2
    ) AS median_sales
FROM sales
GROUP BY item_name, item_code
ORDER BY median_sales DESC;

