-- Each city has one branch. Find the total sales of a specific city (İstanbul for example)

SELECT DATE(date_) AS date_, SUM(total_price) AS total_price
FROM sales
WHERE city = 'İstanbul'
GROUP BY DATE(date_)
ORDER BY date_;

