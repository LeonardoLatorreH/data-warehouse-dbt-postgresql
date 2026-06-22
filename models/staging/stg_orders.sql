with source as (
    select * from {{ source('northwind', 'orders') }}
),

renamed as (
    select
        order_id,
        customer_id,
        employee_id,
        order_date::date as order_date,
        required_date::date as required_date,
        shipped_date::date as shipped_date,
        ship_via,
        freight,
        ship_name,
        ship_city,
        ship_country
    from source
)

select * from renamed