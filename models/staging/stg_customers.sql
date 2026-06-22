with source as (
    select * from {{ source('northwind', 'customers') }}
),

renamed as (
    select
        customer_id,
        company_name,
        contact_name,
        contact_title,
        city,
        country
    from source
)

select * from renamed