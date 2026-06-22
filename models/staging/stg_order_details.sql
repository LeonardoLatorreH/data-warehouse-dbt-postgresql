with source as (
    select * from {{ source('northwind', 'order_details') }}
),

renamed as (
    select
        order_id,
        product_id,
        unit_price,
        quantity,
        discount,
        round((unit_price * quantity * (1 - discount))::numeric, 2) as total_price
    from source
)

select * from renamed