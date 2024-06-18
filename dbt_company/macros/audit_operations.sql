{% macro insert_audit(action_name) -%}

insert into DBT_PRACTICE_COMPANY.STAGING.DBT_AUDITS (audit_type) 
values ('{{ action_name }}');

{%- endmacro %}