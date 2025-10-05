






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and total_amount > 0
)
 as expression


    from `project-data-engineer-469310`.`dbt_glramira`.`stg_fact_orders`
    

),
validation_errors as (

    select
        *
    from
        grouped_expression
    where
        not(expression = true)

)

select *
from validation_errors







