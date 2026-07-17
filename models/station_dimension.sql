with bike as(

    select distinct start_station_id,START_STATION_NAME,
START_LAT,START_LNG
from {{source('demo','BIKE_TRIPS')}}

)
select * from bike