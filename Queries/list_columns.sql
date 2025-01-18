--list the columns of 'sales' table
select column_name
from information_schema.columns
where table_name='sales'