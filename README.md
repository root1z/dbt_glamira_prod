# DBT Project — Product Data Modeling (BigQuery)

## 📌 Giới thiệu

Dự án này dùng **dbt (Data Build Tool)** để quản lý, transform và chuẩn hóa dữ liệu  trên **BigQuery**.  
Mục tiêu:
- Chuẩn hóa schema (ép kiểu dữ liệu, rename cột)
- Tạo tầng staging (`stg_`) và modeling (`dim_`, `fact_`)
- Dễ dàng triển khai CI/CD qua GitHub + dbt Cloud / dbt Core

---

## 📂 Cấu trúc thư mục



cd export_data/
 1564  ls
 1565  vi bigquery_Integration.py 
 1566  vi upload_jsonl_to_gcs.py
 1567  mkdir dbt_glamira
 1568  . "\home\quakinh943\.cursor-server\bin\5911e9593196a000b1c00553aaf03b0b32042b90/out/vs/workbench/contrib/terminal/common/scripts/shellIntegration-bash.sh"
 1569  cd
 1570  dbt init dbt_glamira_prod
 1571  pip install dbt-bigquery
 1572  uv add dbt-bigquery
 1573  cd dbt_glamira/
 1574  uv add dbt-bigquery
 1575  uv sync
 1576  dbt --version
 1577  dbt add dbt-bigquery
 1578  uv add dbt-bigquery
 1579  dbt add dbt-bigquery
 1580  dbt --version
 1581  source .venv/bin/activate
 1582  dbt --version
 1583  dbt init my_project
 1584  source .venv/bin/inactivate
 1585  deactivate
 1586  ls
 1587  cd
 1588  ls
 1589  mkdir dbt_glamira_prod
 1590  cd dbt_glamira_prod/
 1591  uv init
 1592  ls
 1593  cd export_data/
 1594  ls
 1595  vi project-data-engineer-469310-98e0c9323b28.json
 1596  cp project-data-engineer-469310-98e0c9323b28.json /home/quakinh943/dbt_glamira_prod/
 1597  cd
 1598  cd dbt_glamira_prod/
 1599  ls
 1600  pwd
 1601  vi project-data-engineer-469310-98e0c9323b28.json
 1602  source .venv/bin/activat
 1603  source .venv/bin/activate
 1604  uv sync
 1605  uv add dbt-bigquery
 1606  source .venv/bin/activate
 1607  dbt init my_project
 1608  dbt init glramira
 1609  dbt debug
 1610  cd glramira/
 1611  ls
 1612  dbt debug
 1613  ls -la
 1614  cd ~/.dbt/profiles.yml
 1615  cat ~/.dbt/profiles.yml
 1616  vi ~/.dbt/profiles.yml
 1617  dbt debug
 1618  vi ~/.dbt/profiles.yml
 1619  dbt debug
 1620  dbt run
 1621  vi ~/.dbt/profiles.yml
 1622  dbt run
 1623  dbt run -m stg_order
 1624  vi ~/.dbt/profiles.yml
 1625  dbt run -m stg_order
 1626  vi ~/.dbt/profiles.yml
 1627  vi ~/.dbt/profiles.yml
 1628  dbt run -m stg_fact_orders
 1629  vi ~/.dbt/profiles.yml
 1630  cat ~/.dbt/profiles.yml
 1631  vi ~/.dbt/profiles.yml
 1632  dbt run -m stg_fact_orders
 1633  vi ~/.dbt/profiles.yml
 1634  dbt run -m stg_fact_orders
 1635  source .venv/bin/activate
 1636  clear
 1637  dbt debug
 1638  cd glramira/
 1639  dbt debug
 1640  dbt run -m stg_dim_store
 1641  dbt run -m stg_dim_product
 1642  dbt run -m stg_dim_date
 1643  dbt run -m stg_dim_device
 1644  dbt run -m stg_dim_location
 1645  dbt run -m stg_dim_user
 1646  history# dbt_glamira_prod
