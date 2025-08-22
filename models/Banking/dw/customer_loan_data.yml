{{ config(materialized='table') }}

select ld.Loan_ID,
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

    from {{ ref('int_customer_loan_data') }} ld 