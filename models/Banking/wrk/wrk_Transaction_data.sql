with source as (
    select * from {{ source('banking_data', 'Transaction') }}
)


select * from source