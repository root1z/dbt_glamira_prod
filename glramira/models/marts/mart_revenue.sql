SELECT 
  a2.product_name,
  a3.country,
  SUM(a1.final_amount * a1.exchange_rate) AS total_revenue,
  COUNT(DISTINCT a1.order_id) AS total_orders
FROM {{ ref('stg_fact_orders') }} a1
LEFT JOIN {{ ref('stg_dim_product') }} a2
  ON a1.product_id = a2.product_id
LEFT JOIN {{ ref('stg_dim_location') }} a3
  ON a1.location_id = a3.location_id
GROUP BY 1,2
