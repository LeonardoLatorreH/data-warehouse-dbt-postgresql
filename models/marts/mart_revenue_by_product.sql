with sales as (
    select * from {{ ref('mart_sales') }}
),

final as (
    select
        product_name,
        count(distinct order_id)            as total_orders,
        sum(quantity)                       as total_units,
        round(sum(total_price)::numeric, 2) as total_revenue,
        round(avg(discount)::numeric, 4)    as avg_discount
    from sales
    group by product_name
    order by total_revenue desc
)

select * from final