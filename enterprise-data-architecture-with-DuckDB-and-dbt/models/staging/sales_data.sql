-- models/staging/sales_data.sql
-- staging model that selects from the seeded raw table

with src as (
    select * from {{ source('raw', 'sales_data') }}
)

select
    order_id,
    product,
    category,
    price,
    quantity,
    order_date
from src
