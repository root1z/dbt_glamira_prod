WITH device AS (
    SELECT DISTINCT
        farm_fingerprint(
            CONCAT(
                COALESCE(device_id, ''),
                COALESCE(user_agent, ''),
                COALESCE(resolution, '')
            )
        ) AS device_id,

        CAST(device_id AS STRING) AS raw_device_id,
        CAST(resolution AS STRING) AS resolution,
        CAST(user_agent AS STRING) AS user_agent,
        CASE
            WHEN regexp_contains(user_agent, r'Windows NT [0-9._]+') 
                THEN regexp_extract(user_agent, r'Windows NT [0-9._]+')
            WHEN regexp_contains(user_agent, r'Android\s+[0-9._]+') 
                THEN regexp_extract(user_agent, r'Android\s+[0-9._]+')
            WHEN regexp_contains(user_agent, r'iPhone OS [0-9_]+') 
                THEN replace(regexp_extract(user_agent, r'iPhone OS [0-9_]+'), '_', '.')
            WHEN regexp_contains(user_agent, r'Mac OS X [0-9_]+') 
                THEN replace(regexp_extract(user_agent, r'Mac OS X [0-9_]+'), '_', '.')
            WHEN regexp_contains(user_agent, r'Linux') THEN 'Linux'
            ELSE 'Other'
        END AS os,
        CASE
            WHEN regexp_contains(user_agent, r'SM-[^;\)]+') 
                THEN regexp_extract(user_agent, r'SM-[^;\)]+')
            WHEN regexp_contains(user_agent, r'LG-[^;\)]+') 
                THEN regexp_extract(user_agent, r'LG-[^;\)]+')
            WHEN regexp_contains(user_agent, r'MI [^;\)]+') 
                THEN regexp_extract(user_agent, r'MI [^;\)]+')
            WHEN regexp_contains(user_agent, r'Windows') 
                THEN 'PC Windows'
            WHEN regexp_contains(user_agent, r'Macintosh') THEN 'Mac'
            WHEN regexp_contains(user_agent, r'iPhone') THEN 'iPhone'
            WHEN regexp_contains(user_agent, r'iPad') THEN 'iPad'
            ELSE 'Unknown'
        END AS device_model,
        CASE
            WHEN regexp_contains(user_agent, r'Mobile') THEN 'Mobile'
            WHEN regexp_contains(user_agent, r'Tablet') THEN 'Tablet'
            ELSE 'Desktop'
        END AS device_type

    FROM `project-data-engineer-469310`.`product_info`.`event`
)
SELECT * FROM device