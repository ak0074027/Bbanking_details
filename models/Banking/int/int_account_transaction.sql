{{ config(materialized='table') }}


SELECT
    a.account_id,
    a.customer_id,
    a.branch_id,
    a.account_type,
    a.balance,
    t.transaction_id,
    t.transaction_type,
    t.amount,
    t.transaction_date,
    t.description
FROM {{ ref('wrk_account_data') }} a
LEFT JOIN {{ ref('wrk_Transaction_data') }} t
    ON a.account_id = t.account_id
