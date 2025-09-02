with source as (
    select * from {{ source('banking_data', 'FACT_TRANSACTION') }}
)


select * from source