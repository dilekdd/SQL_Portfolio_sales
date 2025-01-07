-- find the daily total sales by branch. (There is one branch in each city)
select city, sum(total_price) as total_sales
from sales
where date_ between '2019-04-23 00:00:00' and '2019-04-23 23:59:59'
group by city
order by total_sales;