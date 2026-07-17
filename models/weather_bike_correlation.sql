with cte as(
    select *
    from {{ref('trip_fact')}} t
    left join {{ref('dailyweather')}} d on t.STARTED_AT = d.dateofweather
)
select * from CTE