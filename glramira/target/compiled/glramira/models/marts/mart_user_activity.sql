SELECT 
       a2.user_id,
       a2.email_address,
       a3.full_date
FROM `project-data-engineer-469310`.`dbt_glramira`.`stg_fact_orders` a1
LEFT JOIN `project-data-engineer-469310`.`dbt_glramira`.`stg_dim_user` a2
  ON a1.user_id = a2.user_id
LEFT JOIN `project-data-engineer-469310`.`dbt_glramira`.`stg_dim_date` a3
  ON a1.date_id = a3.date_id