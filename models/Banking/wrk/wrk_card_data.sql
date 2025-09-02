with card_data as 
(select * from {{ source("banking_data", "DIM_CARD") }})

select * from card_data
