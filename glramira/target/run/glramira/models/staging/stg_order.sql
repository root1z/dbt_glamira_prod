

  create or replace view `project-data-engineer-469310`.`dbt_glramira`.`stg_order`
  OPTIONS()
  as select
  _id,
  time_stamp,
  ip,
  user_agent,
  resolution,
  user_id_db,
  device_id,
  api_version,
  store_id,
  local_time
from `project-data-engineer-469310`.`product_info`.`event`;

