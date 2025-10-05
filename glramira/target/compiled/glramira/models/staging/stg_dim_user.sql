WITH user AS (
    SELECT DISTINCT
        farm_fingerprint(concat(
        coalesce(cast((email_address) as string), null)
    )) AS user_id,
        CAST(email_address AS STRING) AS email_address
    FROM `project-data-engineer-469310`.`product_info`.`event`
    WHERE email_address IS NOT NULL
)
SELECT * FROM user