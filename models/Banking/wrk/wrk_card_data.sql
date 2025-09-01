with card_data as 
(select * from {{ source("banking_data", "CARD") }})

select * from card_data
