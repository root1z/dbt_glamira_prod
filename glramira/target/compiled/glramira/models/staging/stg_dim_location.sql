WITH location AS (
    SELECT DISTINCT
        farm_fingerprint(
            CONCAT(
                COALESCE(CAST(country AS STRING), ''),
                COALESCE(CAST(country_code AS STRING), ''),
                COALESCE(CAST(city AS STRING), ''),
                COALESCE(CAST(region AS STRING), '')
            )
        ) AS location_id,
        CAST(country AS STRING) AS country,
        CAST(country_code AS STRING) AS country_code,
        CAST(region AS STRING) AS region,
        CAST(city AS STRING) AS city
    FROM `project-data-engineer-469310`.`product_info`.`ip_locations`
)
SELECT * FROM location