




    with grouped_expression as (
    select
        
        
    
  user_agent is not null as expression


    from `project-data-engineer-469310`.`dbt_glramira`.`stg_dim_device`
    

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



