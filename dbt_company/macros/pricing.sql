
{% macro discount_amount(discount_percentage, extended_price, scale=2) %}
    (-1 * {{ discount_percentage }} * {{ extended_price }})::numeric(16, {{ scale }})
{% endmacro %}
