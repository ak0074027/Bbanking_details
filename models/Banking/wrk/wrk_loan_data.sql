with loan_data as 
(   select
        Loan_ID,
        Customer_ID,
        Account_ID,
        Loan_Type,
        Principal_Amount,
        Interest_Rate,
        Start_Date,
        End_Date,
        Status
from BANKING_DB.BANING_DETAILS.LOAN)

select * from loan_data