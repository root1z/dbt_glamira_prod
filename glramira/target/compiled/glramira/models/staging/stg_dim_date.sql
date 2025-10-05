WITH date AS (
    SELECT DISTINCT
        CAST(FORMAT_TIMESTAMP('%m%d%Y', TIMESTAMP_SECONDS(time_stamp)) AS INT64) AS date_id,
        FORMAT_TIMESTAMP('%m/%d/%Y', TIMESTAMP_SECONDS(time_stamp)) AS full_date,
        CAST(FORMAT_TIMESTAMP('%d', TIMESTAMP_SECONDS(time_stamp)) AS INT64) AS day,
        CAST(FORMAT_TIMESTAMP('%m', TIMESTAMP_SECONDS(time_stamp)) AS INT64) AS month,
        CAST(FORMAT_TIMESTAMP('%Y', TIMESTAMP_SECONDS(time_stamp)) AS INT64) AS year,
        CASE 
            WHEN EXTRACT(DAYOFWEEK FROM TIMESTAMP_SECONDS(time_stamp)) IN (1, 7) THEN TRUE 
            ELSE FALSE 
        END AS is_weekend
    FROM `project-data-engineer-469310`.`product_info`.`event`
)
SELECT * FROM date