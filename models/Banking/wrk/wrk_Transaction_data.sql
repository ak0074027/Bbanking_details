with source as (
    select * from {{ source('your_source_schema', 'Transaction') }}
)
banking_data

select * from source