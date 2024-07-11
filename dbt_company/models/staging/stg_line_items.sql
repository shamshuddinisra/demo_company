{{
    config(
        materialized = 'table'
    )
}}

with line_items as (
    select 
        {{
            dbt_utils.generate_surrogate_key([
                'L_ORDERKEY',
                'L_LINENUMBER'
            ])
        }} as order_item_key,
        L_ORDERKEY       as order_key,
        L_PARTKEY        as part_key,
        L_LINENUMBER     as line_number,
        L_QUANTITY       as quantity,
        L_EXTENDEDPRICE  as extended_price,
        L_DISCOUNT       as discount_percentage,
        L_TAX            as tax_rate
    from {{source('SNOWFLAKE_SAMPLE_DATA','lineitem')}}
)

select * from line_items