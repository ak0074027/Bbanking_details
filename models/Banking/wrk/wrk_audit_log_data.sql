with AUDIT_LOG as (
    select * from {{ source('banking_data', 'AUDIT_LOG') }}
)

select * from AUDIT_LOG