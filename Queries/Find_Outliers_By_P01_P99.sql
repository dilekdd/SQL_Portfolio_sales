-- Calculate the outliers by using percentile approach

-- WITH Percentiles AS (
--     SELECT 
--         PERCENTILE_CONT(0.01) WITHIN GROUP (ORDER BY total_price) AS p01,
--         PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY total_price) AS p99
--     FROM sales
-- )
-- SELECT *
-- FROM sales
-- WHERE total_price < (SELECT p01 FROM Percentiles)
--    OR total_price > (SELECT p99 FROM Percentiles);



WITH Percentiles AS (
    SELECT 
        PERCENTILE_CONT(0.01) WITHIN GROUP (ORDER BY total_price) AS p01,
        PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY total_price) AS p99
    FROM sales
)
SELECT *
FROM sales
CROSS JOIN percentiles
WHERE total_price < p01 --(SELECT p01 FROM Percentiles)
   OR total_price > p99 --(SELECT p99 FROM Percentiles);