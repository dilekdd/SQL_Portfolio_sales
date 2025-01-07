--Top 5 Customers by Total Purchase Value
select distinct customer_code, customer_name, sum(total_price) as total_sales
from sales
group by customer_code, customer_name
order by total_sales desc
limit 5;