-- For each product:

-- How many units were sold?
-- What was the total sales amount in TL?
-- When was it first sold, and when was it last sold?
-- At what lowest price was it sold?
-- At what highest price was it sold?
-- At what average price was it sold?
-- Write the SQL query to retrieve this information.

SELECT 
    item_code, item_name, brand, category1, category2,
    SUM(amount) AS total_amount,
    SUM(total_price) AS total_sale,
    MIN(date_) AS first_sale_date,
    MAX(date_) AS last_sale_date,
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    ROUND(AVG(price), 2) AS avg_price
FROM  sales
GROUP BY item_code, item_name, brand, category1, category2;

