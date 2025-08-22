with source as (
    select * from {{ source('banking_data', 'Account') }}
)

select * from source