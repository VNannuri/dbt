with trips as(

    select ride_id,STARTED_AT, start_station_id,START_STATION_NAME,End_station_id,MEMBER_CASUAL,
    datediff('second',ENDED_AT,STARTED_AT) AS tripduration

from {{source('demo','BIKE_TRIPS')}}

)
select * from trips