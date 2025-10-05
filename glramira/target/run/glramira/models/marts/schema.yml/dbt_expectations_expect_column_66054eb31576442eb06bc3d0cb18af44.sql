
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and final_amount_usd > 0
)
 as expression


    from `project-data-engineer-469310`.`dbt_glramira`.`fct_orders`
    

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








  
  
      
    ) dbt_internal_test