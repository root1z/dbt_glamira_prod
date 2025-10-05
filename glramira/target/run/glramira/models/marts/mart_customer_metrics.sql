
  
    

    create or replace table `project-data-engineer-469310`.`dbt_glramira`.`mart_customer_metrics`
      
    
    

    
    OPTIONS()
    as (
      SELECT
    user_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(final_amount*exchange_rate) AS total_revenue,
    AVG(final_amount*exchange_rate) AS avg_order_value
FROM `project-data-engineer-469310`.`dbt_glramira`.`stg_fact_orders`
GROUP BY 1
    );
  