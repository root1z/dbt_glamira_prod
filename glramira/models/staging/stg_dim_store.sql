WITH orders AS (
    SELECT DISTINCT
        CAST(store_id AS INT64) AS store_id,
        CONCAT('glamira_', CAST(store_id AS STRING)) AS store_name
    FROM {{ source('product_info', 'event') }}
)
SELECT * FROM orders
