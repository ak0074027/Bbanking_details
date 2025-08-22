{{ config(materialized='table') }}

with loan_data as (
    select
        l.Loan_ID,
        l.Customer_ID,
        l.Loan_Type,
        l.Principal_Amount,
        l.Interest_Rate,
        l.Start_Date,
        l.End_Date,
        l.Status,
        datediff(day, l.Start_Date, coalesce(l.End_Date, current_date)) as loan_duration_days,
        (l.Principal_Amount * l.Interest_Rate) as total_interest_amount
    from {{ ref('wrk_loan_data') }} l
    where l.Status = 'Active'
),

customer_data as (
    select
        Customer_ID,
        concat(First_Name, ' ', Last_Name) as full_name,
        Email,
        Phone
    from {{ ref('wrk_customer_data') }}
)

select
    ld.Loan_ID,
    ld.Loan_Type,
    ld.Principal_Amount,
    ld.Interest_Rate,
    ld.Start_Date,
    ld.End_Date,
    ld.loan_duration_days,
    ld.total_interest_amount,
    cd.full_name,
    cd.Email,
    cd.Phone
from loan_data ld
left join customer_data cd on ld.Customer_ID = cd.Customer_ID
