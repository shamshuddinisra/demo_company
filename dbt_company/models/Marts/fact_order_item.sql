{{
    config(
        materialized = 'table'
    )
}}

select 
    {{discount_amount('line_item.discount_percentage','line_item.extended_price')}} as item_discount_amount,
    orders.ORDER_KEY,
    orders.customer_key,
    orders.order_date,
    line_item.order_item_key,
    line_item.part_key,
    line_item.line_number,
    line_item.extended_price

from 
    {{ref('stg_orders')}} as orders
join 
    {{ref('stg_line_items')}} as line_item
        on orders.order_key = line_item.order_key
order by 
    orders.order_date