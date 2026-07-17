with CTE as(
select started_AT,
Date(to_timestamp(started_AT)) AS Date_StartedAT,
Hour(to_timestamp(started_AT)) AS Hour_StartedAT,
case when dayname(started_AT) in ('sat','sun') then 'Weekend' else 'BusinessDay' END AS Day_Type,
{{get_season('started_AT')}} AS SEASON,
    {{function1('STARTED_AT')}} AS SLA,
RIDEABLE_TYPE
from {{source('demo','BIKE_TRIPS')}}
)

select * from CTE