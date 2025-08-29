

{{ config(materialized="table") }}
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
    
    c.branch_name,
    c.address AS branch_address,

    a.transaction_id,
    a.transaction_type,
    a.amount,
    a.transaction_date,
    a.description

FROM {{ ref('int_account_transaction') }} c
LEFT JOIN {{ ref('int_customer_account_details') }} a 
    ON c.customer_id = a.customer_id
	and c.account_id=a.account_id
