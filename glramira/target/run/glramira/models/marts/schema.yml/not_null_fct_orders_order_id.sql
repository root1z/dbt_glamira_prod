
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_id
from `project-data-engineer-469310`.`dbt_glramira`.`fct_orders`
where order_id is null



  
  
      
    ) dbt_internal_test