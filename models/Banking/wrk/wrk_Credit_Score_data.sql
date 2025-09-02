with Credi_score as 
(select * from 
{{ source('banking_data', 'FACT_CREDIT_SCORE') }})

select * from Credi_score