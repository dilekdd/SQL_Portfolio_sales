--rank customers based on frequency of purchases

SELECT customer_code, COUNT(*) AS amount,
 DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS purchase_rank
FROM sales
GROUP BY customer_code;