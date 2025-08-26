with Credi_score as 
(select * from 
{{ source('banking_data', 'Credit_Score') }})

select * from Credi_score