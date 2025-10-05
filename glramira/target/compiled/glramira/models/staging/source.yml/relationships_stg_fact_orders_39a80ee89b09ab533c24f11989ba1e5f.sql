
    
    

with child as (
    select user_id as from_field
    from `project-data-engineer-469310`.`dbt_glramira`.`stg_fact_orders`
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


