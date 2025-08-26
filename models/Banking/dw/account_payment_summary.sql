{{ config(materialized='table') }}

with account as (
    select
        account_id,
        customer_id,
        account_type,
        balance,
        created_at as account_created_at,
        first_name,
        last_name
    from {{ ref('int_account_summary') }}
),

payment as (
    select
        payment_id,
        transaction_id,
        account_id,
        customer_id as payment_customer_id,
        card_id,
        payment_mode,
        payment_status
    
    from {{ ref('int_payment_summary') }}
)

select
a.*,p.*
    from payment p
left join account a
    on p.account_id = a.account_id
