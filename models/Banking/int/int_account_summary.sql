
{{ config(materialized='table') }}

with account_data as (
    select
        acct.account_id,
        acct.customer_id,
        acct.account_type,
        acct.balance,
        acct.created_at,
        cust.first_name,
        cust.last_name
    from {{ ref('stg_account') }} acct
    left join {{ ref('stg_customer') }} cust
        on acct.customer_id = cust.customer_id
)

select * from account_data