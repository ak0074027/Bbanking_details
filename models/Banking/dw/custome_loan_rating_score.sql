{{ config(materialized="table") }} 



with rating_score as
(select * from {{ ref("int_custome_loan_rating_score") }})

select * from rating_score
