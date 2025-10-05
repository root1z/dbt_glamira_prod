

  create or replace view `project-data-engineer-469310`.`dbt_glramira`.`stg_dim_store`
  OPTIONS()
  as WITH orders AS (
    SELECT DISTINCT
        CAST(store_id AS INT64) AS store_id,
        CONCAT('glamira_', CAST(store_id AS STRING)) AS store_name
    FROM `project-data-engineer-469310`.`product_info`.`event`
)
SELECT * FROM orders;

