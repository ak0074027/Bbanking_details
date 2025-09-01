with card_data as 
(select * from {{ source("banking_data", "card") }})

select * from card_data
