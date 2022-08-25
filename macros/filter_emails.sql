{% macro filter_emails(table_name) %}
    SELECT * FROM {{ table_name }}
    WHERE REGEXP_CONTAINS(email, r"text_to_exclude") = false
    AND REGEXP_CONTAINS(email, r"testinterno") = false
    AND REGEXP_CONTAINS(email, r"test@test") = false
{% endmacro %}
