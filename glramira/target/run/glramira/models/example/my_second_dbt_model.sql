

  create or replace view `project-data-engineer-469310`.`product_info`.`my_second_dbt_model`
  OPTIONS()
  as -- Use the `ref` function to select from other models

select *
from `project-data-engineer-469310`.`product_info`.`my_first_dbt_model`
where id = 1;

