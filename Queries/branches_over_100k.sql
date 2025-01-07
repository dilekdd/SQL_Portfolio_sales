-- find the branches that have total sales more than 100000
select city, sum(total_price) as total_sales
from sales
group by city
having sum(total_price) > 100000
order by total_sales desc;