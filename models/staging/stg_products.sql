with source as (
    select * from {{ source('northwind', 'products') }}
),

renamed as (
    select
        product_id,
        product_name,
        supplier_id,
        category_id,
        unit_price,
        units_in_stock,
        units_on_order,
        discontinued
    from source
)

select * from renamed