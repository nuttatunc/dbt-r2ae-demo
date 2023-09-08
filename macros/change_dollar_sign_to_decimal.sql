{% macro change_dollar_sign_to_decimal(column, how) %}
    {% if how == "decimal" %}
        CAST(REPLACE(REPLACE({{column}},'$',''),',','') AS DECIMAL(10,2)) AS {{ column ~ "_decimal" }}
    {% elif how == "integer" %}
        CAST(REPLACE(REPLACE({{column}},'$',''),',','') AS INTEGER) AS {{ column ~ "_integer" }}
    {% else %}
        NULL AS {{ column }}
    {% endif %}
{% endmacro %}