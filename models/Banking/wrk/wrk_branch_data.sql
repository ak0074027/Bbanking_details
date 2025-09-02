



with source as (
    select * from {{ source('banking_data', 'DIM_BRANCH') }}
)

select * from source