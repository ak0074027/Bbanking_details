



{{ config(materialized='table') }}

SELECT
    ca.customer_id,
    ca.first_name,
    ca.last_name,
    ca.dob,
    ca.email,
    ca.phone,
    ca.customer_address,

    ca.account_id AS account_id,
    ca.account_type,
    ca.balance AS account_balance,
    ca.account_created_at,
    ca.branch_name,
    ca.branch_address,

    cl.loan_id,
    cl.loan_type,
    cl.principal_amount,
    cl.interest_rate,
    cl.start_date AS loan_start_date,
    cl.end_date AS loan_end_date,
    cl.status AS loan_status

FROM {{ ref('int_customer_account_details') }} ca
LEFT JOIN {{ ref('int_customer_loan_details') }} cl
    ON ca.customer_id = cl.customer_id
    AND ca.account_id = cl.account_id
