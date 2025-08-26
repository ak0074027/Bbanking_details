with source as (
    select * from {{ source('banking_data', 'Transaction') }}
)
banking_data

select * from source