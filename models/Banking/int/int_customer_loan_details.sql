{{ config(materialized='table') }}

SELECT
    l.loan_id,
    c.customer_id,
    c.first_name,
    c.last_name,
    l.account_id,
    l.loan_type,
    l.principal_amount,
    l.interest_rate,
    l.start_date,
    l.end_date,
    l.status
FROM {{ ref('wrk_loan_data') }} l
LEFT JOIN {{ ref('wrk_customer_data') }} c ON l.customer_id = c.customer_id