SELECT
    user_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(final_amount*exchange_rate) AS total_revenue
FROM {{ ref('stg_fact_orders') }}
GROUP BY 1