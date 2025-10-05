WITH 
ip_data AS (
    SELECT DISTINCT
        CAST(ip AS STRING) AS ip,
        COALESCE(CAST(country AS STRING), '') AS country,
        COALESCE(CAST(country_code AS STRING), '') AS country_code,
        COALESCE(CAST(region AS STRING), '') AS region,
        COALESCE(CAST(city AS STRING), '') AS city
    FROM `project-data-engineer-469310`.`product_info`.`ip_locations`
),
exchange_rate AS (
    SELECT
        COALESCE(CAST(symbol AS STRING), '') AS symbol,
        COALESCE(CAST(exchange_rate_to_usd AS FLOAT64), 0) AS exchange_rate
    FROM `project-data-engineer-469310`.`product_info`.`exchange_rate`
),
base AS (
    SELECT DISTINCT
        farm_fingerprint(
            CONCAT(
                COALESCE(CAST(e1.order_id AS STRING), ''),
                COALESCE(CAST(cp.product_id AS STRING), ''),
                COALESCE(CAST(e1.device_id AS STRING), '')
            )
        ) AS event_id,
        SAFE_CAST(REPLACE(CAST(e1.order_id AS STRING), '.0', '') AS INT64) AS order_id,
        COALESCE(CAST(cp.product_id AS INT64), 0) AS product_id,
        CAST(e1.device_id AS STRING) AS raw_device_id,
        CAST(FORMAT_TIMESTAMP('%m%d%Y', TIMESTAMP_SECONDS(e1.time_stamp)) AS INT64) AS date_id,
        COALESCE(CAST(e1.store_id AS INT64), 0) AS store_id,
        farm_fingerprint(
            CONCAT(
                COALESCE(e1.device_id, ''),
                COALESCE(e1.user_agent, ''),
                COALESCE(e1.resolution, '')
            )
        ) AS device_id,
        farm_fingerprint(COALESCE(CAST(e1.email_address AS STRING), '')) AS user_id,
        CAST(e1.ip AS STRING) AS ip_address,
        SAFE_CAST(
            REGEXP_REPLACE(
                REGEXP_REPLACE(CAST(cp.price AS STRING), r'[.,]00\b', ''),  
                r'[^0-9]', ''                                               
            ) AS INT64
        ) AS price,
        SAFE_CAST(
            REGEXP_REPLACE(
                REGEXP_REPLACE(CAST(cp.amount AS STRING), r'[.,]00\b', ''),  
                r'[^0-9]', ''                                               
            ) AS INT64
        ) AS amount,

        CAST(cp.currency AS STRING) AS currency,
        COALESCE(
            SAFE_CAST(
                REGEXP_REPLACE(
                    REGEXP_REPLACE(CAST(cp.price AS STRING), r'[.,]00\b', ''),  
                    r'[^0-9]', ''                                               
                ) AS INT64
            ),
            0
        )
        *
        COALESCE(
            SAFE_CAST(
                REGEXP_REPLACE(
                    REGEXP_REPLACE(CAST(cp.amount AS STRING), r'[.,]00\b', ''),  
                    r'[^0-9]', ''                                               
                ) AS INT64
            ),
            0
        ) AS final_amount,

        CAST(e1.is_paypal AS STRING) AS is_paypal

    FROM `project-data-engineer-469310`.`product_info`.`event` AS e1
    CROSS JOIN UNNEST(e1.cart_products) AS cp
    WHERE e1.collection = 'checkout_success'
)

SELECT
    b.*,
    farm_fingerprint(
        CONCAT(
            COALESCE(e2.country, ''),
            COALESCE(e2.country_code, ''),
            COALESCE(e2.region, ''),
            COALESCE(e2.city, '')
        )
    ) AS location_id,
    e3.exchange_rate
FROM base b
LEFT JOIN ip_data e2
    ON b.ip_address = e2.ip
LEFT JOIN exchange_rate e3
    ON b.currency = e3.symbol