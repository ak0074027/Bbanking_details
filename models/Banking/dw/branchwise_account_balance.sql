{{ config(materialized="table") }} 


select * from {{ ref("int_account_branch_data") }}