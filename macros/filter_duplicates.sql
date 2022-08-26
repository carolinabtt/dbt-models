{% macro filter_duplicates(table_name, variable_list) %}
    SELECT * EXCEPT(event) FROM (
        SELECT *,
        ROW_NUMBER() OVER (PARTITION BY
            {% for var in variable_list %}
                {{var}}
                {% if not loop.last %}
                    {{','}}
                {% endif %}
            {% endfor %}
        ) AS event
        FROM {{table_name}}
        )
    WHERE event = 1
{% endmacro %}
