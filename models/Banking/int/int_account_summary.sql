
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
    from {{ ref('wrk_account_data') }} acct
    left join {{ ref('wrk_customer_data') }} cust
        on acct.customer_id = cust.customer_id
)

select * from account_data