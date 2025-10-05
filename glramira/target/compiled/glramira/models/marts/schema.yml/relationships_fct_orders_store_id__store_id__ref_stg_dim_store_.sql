
    
    

with child as (
    select store_id as from_field
    from `project-data-engineer-469310`.`dbt_glramira`.`fct_orders`
    where store_id is not null
),

parent as (
    select store_id as to_field
    from `project-data-engineer-469310`.`dbt_glramira`.`stg_dim_store`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


