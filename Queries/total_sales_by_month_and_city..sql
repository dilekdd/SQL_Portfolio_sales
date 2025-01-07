-- find total sales by month

SELECT city, TO_CHAR(date_, 'Month') AS monthname,  EXTRACT(MONTH FROM date_) AS month_num, SUM(total_price) AS totalsale
FROM SALES
GROUP BY city, TO_CHAR(date_, 'Month'), EXTRACT(MONTH FROM date_)
ORDER BY 1, month_num ;
