-- compares two tables and creates a new table with the differences between them
{{ config(materialized='table') }}

{% set old_relation=adapter.get_relation(
    database='database-name',
    schema='schema_name',
    identifier='dimid'
  ) -%}

{% set dbt_relacion=ref('build_dimid') %}

{{ audit_catch_differences (
  baseline=old_relation,
  compare_with=dbt_relation,
  select =['employee_id'], -- variable I want to compare
  primary_key='employee_id'
)
}}

-- to execute:
-- dbt build -s compare_siferences
