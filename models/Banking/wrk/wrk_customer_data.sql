WITH customer_data AS (
SELECT
Customer_ID,
First_Name,
Last_Name,
DOB,
Email,
Phone,
Created_At AS Customer_Created_At
----FROM BANKING_DB.BANING_DETAILS.CUSTOMER

FROM {{ source('banking_data', 'Customer') }}
)

SELECT *
FROM customer_data
