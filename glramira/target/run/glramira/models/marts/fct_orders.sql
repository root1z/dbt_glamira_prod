
  
    

    create or replace table `project-data-engineer-469310`.`dbt_glramira`.`fct_orders`
      
    
    

    
    OPTIONS()
    as (
      

WITH
  fact AS (
    SELECT
      event_id,
      order_id,
      product_id,
      device_id,
      user_id,
      date_id,
      store_id,
      location_id,
      currency,
      price,
      amount,
      final_amount,
      exchange_rate,
      CAST(final_amount * COALESCE(exchange_rate, 1) AS FLOAT64) AS final_amount_usd,
      is_paypal
    FROM `project-data-engineer-469310`.`dbt_glramira`.`stg_fact_orders`
  )
,
  dim_date AS (
    SELECT * FROM `project-data-engineer-469310`.`dbt_glramira`.`stg_dim_date`
  )
,
  dim_user AS (
    SELECT * FROM `project-data-engineer-469310`.`dbt_glramira`.`stg_dim_user`
  )
,
  dim_product AS (
    SELECT * FROM `project-data-engineer-469310`.`dbt_glramira`.`stg_dim_product`
  )
,
  dim_store AS (
    SELECT * FROM `project-data-engineer-469310`.`dbt_glramira`.`stg_dim_store`
  )
,
  dim_device AS (
    SELECT * FROM `project-data-engineer-469310`.`dbt_glramira`.`stg_dim_device`
  )
,
  dim_location AS (
    SELECT * FROM `project-data-engineer-469310`.`dbt_glramira`.`stg_dim_location`
  )

SELECT
  f.event_id,
  f.order_id,
  f.product_id,
  p.product_name,
  p.product_price,
  f.user_id,
  u.email_address AS user_email,
  f.device_id,
  dvc.os AS device_os,
  dvc.device_model,
  dvc.device_type,
  f.date_id,
  dt.full_date,
  dt.day,
  dt.month,
  dt.year,
  dt.is_weekend,
  f.store_id,
  st.store_name,
  f.location_id,
  loc.country,
  loc.country_code,
  loc.region,
  loc.city,
  f.currency,
  f.price,
  f.amount,
  f.final_amount,
  f.exchange_rate,
  f.final_amount_usd,
  f.is_paypal
FROM fact f
LEFT JOIN dim_product p ON f.product_id = p.product_id
LEFT JOIN dim_user u ON f.user_id = u.user_id
LEFT JOIN dim_device dvc ON f.device_id = dvc.device_id
LEFT JOIN dim_date dt ON f.date_id = dt.date_id
LEFT JOIN dim_store st ON f.store_id = st.store_id
LEFT JOIN dim_location loc ON f.location_id = loc.location_id
    );
  