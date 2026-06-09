{{
    config(
        materialized='incremental',
        unique_key='C_CUSTKEY',
          on_schema_change='append_new_columns'
           )
}}
select 'rudra' as user_name ,2026 AS YEAR , UPDATE_DTE ,C_NAME ,C_CUSTKEY from  RUDRA_DBT.TPCH_SF1_DBT.CUSTOMER


{% if is_incremental() %}

where update_dte >= (
    select max(update_dte)
    from {{ this }}
)


{% endif %}