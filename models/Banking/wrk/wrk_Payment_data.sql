

with source as (
    select * from {{ source('banking_data', 'FACT_PAYMENT') }}
)


select * from source


