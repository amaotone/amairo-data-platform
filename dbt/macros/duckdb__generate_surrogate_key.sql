-- dbt_utilsはデフォルトではduckdbをサポートしていないので、duckdb__generate_surrogate_keyを作成する必要がある
{%- macro duckdb__generate_surrogate_key(field_list) -%}

    {%- if var("surrogate_key_treat_nulls_as_empty_strings", False) -%}
        {%- set default_null_value = "" -%}
    {%- else -%} {%- set default_null_value = "_dbt_utils_surrogate_key_null_" -%}
    {%- endif -%}

    {%- set fields = [] -%}

    {%- for field in field_list -%}

        {%- do fields.append(
            "coalesce(cast("
            ~ field
            ~ " as VARCHAR), '"
            ~ default_null_value
            ~ "')"
        ) -%}

        {%- if not loop.last %} {%- do fields.append("'-'") -%} {%- endif -%}

    {%- endfor -%}

    md5(concat({{ fields | join(", ") }}))

{%- endmacro -%}
