-- find the most recent product sold
SELECT
	item_code,
	item_name,
	date_
FROM
	(SELECT
		item_code, item_name, date_,
		ROW_NUMBER() OVER(ORDER BY date_ DESC) AS rn
	FROM sales) AS last_sold_item
WHERE rn = 1;
