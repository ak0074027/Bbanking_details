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
        payment_status,
        payment_timestamp
    from {{ ref('int_payment_summary') }}
)

select
    p.payment_id,
    p.transaction_id,
    p.account_id,
    a.customer_id,
    a.account_type,
    a.balance,
    a.account_created_at,
    a.first_name,
    a.last_name,
    p.card_id,
    p.payment_mode,
    p.payment_status
    from payment p
left join account a
    on p.account_id = a.account_id
