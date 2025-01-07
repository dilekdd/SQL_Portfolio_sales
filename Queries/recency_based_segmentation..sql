-- Recency-Based Segmentation, Segment customers based on their last purchase date
WITH max_date_cte AS (
    SELECT MAX(date_) + INTERVAL '2 days' AS analysis_date
    FROM sales
),
customer_last_purchase AS (
    SELECT 
        customer_code,
        MAX(date_) AS last_purchase_date
    FROM sales
    GROUP BY customer_code
)
SELECT 
    clp.customer_code,
    clp.last_purchase_date,
    CASE
        WHEN md.analysis_date - clp.last_purchase_date <= INTERVAL '30 days' THEN 'Active Customer'
        WHEN md.analysis_date - clp.last_purchase_date > INTERVAL '30 days' 
             AND md.analysis_date - clp.last_purchase_date <= INTERVAL '90 days' THEN 'Inactive Customer'
        ELSE 'Dormant Customer'
    END AS recency_segment
FROM customer_last_purchase clp
CROSS JOIN max_date_cte md
ORDER BY clp.customer_code;
