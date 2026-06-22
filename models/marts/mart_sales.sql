with orders as (
    select * from {{ ref('stg_orders') }}
),

order_details as (
    select * from {{ ref('stg_order_details') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

final as (
    select
        o.order_id,
        o.order_date,
        o.ship_country,
        c.company_name as customer_name,
        c.country as customer_country,
        p.product_name,
        od.quantity,
        od.unit_price,
        od.discount,
        od.total_price
    from orders o
    join order_details od on o.order_id = od.order_id
    join products p on od.product_id = p.product_id
    join customers c on o.customer_id = c.customer_id
)

select * from final