-- Calculate 6-Month Moving Average of Revenue
WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', date_) AS truncated_date,
        SUM(total_price) AS monthly_total
    FROM sales
    GROUP BY DATE_TRUNC('month', date_)
)
SELECT
    truncated_date,
    monthly_total,
    ROUND(AVG(monthly_total::NUMERIC) OVER (
        ORDER BY truncated_date
        ROWS BETWEEN 5 PRECEDING AND CURRENT ROW
    ), 2) AS moving_avg_6_months
FROM monthly_revenue
ORDER BY truncated_date;