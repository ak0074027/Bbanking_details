with loan_data(select
    Customer_ID,
    First_Name,
    Last_Name,
    DOB,
    Email,
    Phone,
    Address,
    Created_At
from BANKING_DB.BANING_DETAILS.LOAN)

select * from loan_data