

  create or replace view `project-data-engineer-469310`.`dbt_glramira`.`stg_dim_product`
  OPTIONS()
  as WITH product AS (
      SELECT
        CAST(product_id AS INT64) AS product_id,
        CAST(product_name AS STRING) AS product_name,
        CAST(product_price AS FLOAT64) AS product_price,
        CAST(min_price AS FLOAT64) AS min_price,
        CAST(max_price AS FLOAT64) AS max_price,
        CAST(min_price_format AS STRING) AS min_price_format,
        CAST(max_price_format AS STRING) AS max_price_format

      FROM `project-data-engineer-469310`.`product_info`.`product`
  )
SELECT * FROM product
WHERE product_id != 101993;

