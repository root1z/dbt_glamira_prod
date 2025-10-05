
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select user_id as from_field
    from `project-data-engineer-469310`.`dbt_glramira`.`fct_orders`
    where user_id is not null
),

parent as (
    select user_id as to_field
    from `project-data-engineer-469310`.`dbt_glramira`.`stg_dim_user`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test