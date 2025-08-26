

with source as (
    select * from {{ source('banking_data', 'Payment') }}
)


select * from source


