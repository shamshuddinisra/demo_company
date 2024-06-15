With store_data as (
    select * from {{ source('SNOWFLAKE_SAMPLE_DATA', 'STORE_SALES') }}

),

final as (
    select * from store_data
)

select * from final