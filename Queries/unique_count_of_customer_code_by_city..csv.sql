-- find customer count of the branches (each cisty has one branch)

select city, count(distinct customer_code) as unique_customer_count
from sales
--where city ilike 'istanbul'
group by city;
