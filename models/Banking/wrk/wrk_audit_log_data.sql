with AUDIT_LOG as (
    select * from {{ source('banking_data', 'FACT_AUDIT_LOG') }}
)

select * from AUDIT_LOG