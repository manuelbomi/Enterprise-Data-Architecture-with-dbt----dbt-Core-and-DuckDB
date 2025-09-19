-- models/marts/daily_sales.sql
-- daily revenue aggregated from the staging model

with sales as (
    select * from {{ ref('sales_data') }}
)

select
    order_date,
    count(*) as total_orders,
    sum(price * quantity) as total_revenue
from sales
group by order_date
order by order_date
