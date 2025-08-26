
{{ config(materialized="table") }}

with payment_data as (
select
p.payment_id,
p.transaction_id,
t.account_id,
a.customer_id,
p.card_id,
p.payment_mode,
p.payment_status

from {{ ref("wrk_Payment_data") }} p
left join {{ ref("wrk_Transaction_data") }} t
on p.transaction_id = t.transaction_id
left join {{ ref("wrk_account_data") }} a
on t.account_id = a.account_id
)

select *
from payment_data
