

{{ config(materialized="table") }}

	SELECT
    c.customer_id,
    c.first_name AS first_name,
    c.last_name AS last_name,
    c.dob,
    c.email AS email,
    c.phone,
    c.account_id,
    c.account_type,
    c.balance,
    c.created_at AS account_created_at,
    c.branch_name,
    c.address AS branch_address,
	a.branch_id,
    a.transaction_id,
    a.transaction_type,
    a.amount,
    a.transaction_date,
    a.description,
FROM {{ ref('int_customer_account_details ') }} c
LEFT JOIN {{ ref('int_account_transaction') }} a  ON c.customer_id = a.customer_id