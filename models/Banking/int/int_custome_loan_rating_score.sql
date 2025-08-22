{{ config(materialized='table') }}




With credit_score as(SELECT 
    a.CUSTOMER_ID,
    a.FIRST_NAME,
    a.LAST_NAME,
    a.DOB,
    a.EMAIL,
    a.PHONE,
    a.CUSTOMER_CREATED_AT,
    b.LOAN_ID,
    b.ACCOUNT_ID,
    b.LOAN_TYPE,
    b.PRINCIPAL_AMOUNT,
    b.INTEREST_RATE,
    b.START_DATE,
    b.END_DATE,
    c.SCORE_DATE,
    c.SCORE,
    c.SCORE_SOURCE

FROM {{ ref('wrk_customer_set') }} a
LEFT JOIN {{ ref('wrk_loan_set') }} b
    ON a.CUSTOMER_ID = b.CUSTOMER_ID
LEFT JOIN {{ ref('wrk_Credit_Score_data') }} c
    ON a.CUSTOMER_ID = c.CUSTOMER_ID)

    select * from credit_score
