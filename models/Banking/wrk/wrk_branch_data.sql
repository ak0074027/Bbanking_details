



with source as (
    select * from {{ source('banking_data', 'Branch') }}
)

select * from source