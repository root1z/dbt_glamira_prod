SELECT 
       a2.user_id,
       a2.email_address,
       a3.full_date
FROM {{ ref('stg_fact_orders') }} a1
LEFT JOIN {{ ref('stg_dim_user') }} a2
  ON a1.user_id = a2.user_id
LEFT JOIN {{ ref('stg_dim_date') }} a3
  ON a1.date_id = a3.date_id
