{{ config(materialized='table') }}

with loan_filtered as (
    select
        Loan_ID,
        Customer_ID,
        Account_ID,
        upper(Loan_Type) as Loan_Type,
        Principal_Amount,
        Interest_Rate,
        Start_Date,
        End_Date,
        Status
    from {{ ref('wrk_loan_data') }}
    where Status = 'Active'
),

customer_data as (
    select
        Customer_ID,
        concat(First_Name, ' ', Last_Name) as Customer_Full_Name,
        DOB,
        Email,
        Phone
    from {{ ref('wrk_customer_data') }}
),

loan_enriched as (
    select
        l.Loan_ID,
        l.Customer_ID,
        c.Customer_Full_Name,
        c.DOB,
        c.Email,
        c.Phone,
        l.Account_ID,
        l.Loan_Type,
        l.Principal_Amount,
        l.Interest_Rate,
        l.Start_Date,
        l.End_Date,
        l.Status,
        datediff('day', l.Start_Date, l.End_Date) as Loan_Duration_Days,
        round(l.Principal_Amount * l.Interest_Rate * (datediff('day', l.Start_Date, l.End_Date) / 365.0), 2) as Total_Interest,
        case
            when current_date < l.End_Date then 'Open'
            else 'Closed'
        end as Loan_Status
    from loan_filtered l
    left join customer_data c on l.Customer_ID = c.Customer_ID
)

select * from loan_enriched