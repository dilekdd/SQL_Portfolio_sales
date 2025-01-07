-- Revenue Growth Rate by Month
WITH monthly_revenue AS (
    SELECT 
        DATE_TRUNC('month', date_) AS month_year,
        SUM(total_price) AS total_revenue
    FROM sales
    GROUP BY DATE_TRUNC('month', date_)
),
growth_rate AS (
    SELECT 
        month_year,
        total_revenue,
        LAG(total_revenue) OVER (ORDER BY month_year) AS previous_month_revenue,
        ROUND(
            (total_revenue - LAG(total_revenue) OVER (ORDER BY month_year)) / 
            LAG(total_revenue) OVER (ORDER BY month_year) * 100, 2
        ) AS growth_rate
    FROM monthly_revenue
)
SELECT 
    month_year,
    total_revenue,
    growth_rate
FROM growth_rate
ORDER BY month_year;
