
    
    

with dbt_test__target as (

  select device_id as unique_field
  from `project-data-engineer-469310`.`dbt_glramira`.`stg_dim_device`
  where device_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


