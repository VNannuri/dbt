{% macro function1(x) %}
case when TO_TIMESTAMP({{x}}) < current_date then 'PAST'
else 'Future' END
{% endmacro%}


{%macro get_season(x)%}
CASE
            WHEN MONTH({{x}}) IN (12,1,2)
                THEN 'Winter'
            WHEN MONTH({{x}}) IN (3,4,5)
                THEN 'Spring'
            WHEN MONTH({{x}}) IN (6,7,8)
                THEN 'Summer'
            WHEN MONTH({{x}}) IN (9,10,11)
                THEN 'Fall'
        END
        {%endmacro%}


