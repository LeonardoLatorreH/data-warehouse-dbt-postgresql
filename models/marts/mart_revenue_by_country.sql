with sales as (
    select * from {{ ref('mart_sales') }}
),

final as (
    select
        customer_country,
        count(distinct order_id)        as total_orders,
        sum(quantity)                   as total_units,
        round(sum(total_price)::numeric, 2) as total_revenue,
        round(avg(total_price)::numeric, 2) as avg_order_value
    from sales
    group by customer_country
    order by total_revenue desc
)

select * from final