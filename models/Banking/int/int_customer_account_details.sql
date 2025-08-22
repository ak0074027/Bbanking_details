{{ config(materialized='table') }}



SELECT
    c.customer_id,
    c.first_name AS first_name,
    c.last_name AS last_name,
    c.dob,
    c.email AS email,
    c.phone,
    a.account_id,
    a.account_type,
    a.balance,
    a.created_at AS account_created_at,
    b.branch_name,
    b.address AS branch_address
FROM {{ ref('wrk_customer_data') }} c
LEFT JOIN {{ ref('wrk_account_data') }} a ON c.customer_id = a.customer_id
LEFT JOIN {{ ref('wrk_branch_data') }} b ON a.branch_id = b.branch_id