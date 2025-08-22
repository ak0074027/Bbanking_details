{{ config(materialized='table') }}

with accounts as (
    select * from {{ ref('wrk_account_data') }}
),

branches as (
    select * from {{ ref('wrk_branch_data') }}
),

joined as (
    select
        a.account_id,
        a.customer_id,
        a.account_type,
        a.balance,
        a.created_at,
        b.branch_id,
        b.branch_name,
        b.address as branch_address,
        b.manager_id
    from accounts a
    left join branches b
        on a.branch_id = b.branch_id
),

aggregated as (
    select
        branch_id,
        branch_name,
        count(account_id) as total_accounts,
        sum(balance) as total_balance,
        avg(balance) as average_balance
    from joined
    group by branch_id, branch_name
)

select * from aggregated
