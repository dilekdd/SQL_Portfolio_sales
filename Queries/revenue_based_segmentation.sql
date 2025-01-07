-- Revenue-Based Segmentation
SELECT 
    customer_code,
    customer_name,
    SUM(total_price) AS total_spent,
    CASE
        WHEN SUM(total_price) < 500 THEN 'Low Spender'
        WHEN SUM(total_price) BETWEEN 500 AND 2000 THEN 'Medium Spender'
        ELSE 'High Spender'
    END AS spending_segment
FROM sales
GROUP BY customer_code, customer_name
ORDER BY total_spent DESC;
