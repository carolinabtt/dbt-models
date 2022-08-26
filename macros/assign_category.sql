{% macro assign_categories(table_name, category_code) %}
    WITH table AS (
        SELECT * FROM {{ table_name }}
        LEFT JOIN (SELECT category_description, category_code
        FROM {{ ref('table_categories') }} ) t
        ON {{ table_name }}.{{ category_code}} = t.category_code
        )
    SELECT * FROM table
{% endmacro %}
