-- Most Frequently Purchased Items by Branch
with item_rank as (
   select
       branch,
	   item_name,
	   count(*) as purchase_count,
	   rank () over(partition by branch order by count(*) desc) as rank
	from sales
	group by branch, item_name
)
select
    branch,
	item_name,
	purchase_count
from item_rank
where rank <= 3
order by branch, rank;