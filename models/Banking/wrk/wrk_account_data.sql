with source as (
    select * from {{ source('banking_data', 'DIM_ACCOUNT') }}
)

select * from source