{{
    config(
        materialized = 'table'
    )
}}

with orders as (

    select 
        O_ORDERKEY    as order_key,
        O_CUSTKEY     as customer_key,
        O_ORDERSTATUS as status_code,
        O_TOTALPRICE  as total_price,
        o_orderdate   as order_date
    from {{source('SNOWFLAKE_SAMPLE_DATA','orders')}}
)

select * from orders