--  Monthly Revenue by Region
SELECT 
    region,
    DATE_TRUNC('month', date_) AS month_year,
    SUM(total_price) AS monthly_revenue
FROM sales
GROUP BY region, DATE_TRUNC('month', date_)
ORDER BY region, month_year;