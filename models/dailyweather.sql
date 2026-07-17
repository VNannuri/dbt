WITH daily_weather AS (
    SELECT
        DATE(time) AS dateofweather,
        weather,
        pressure,
        humidity,
        clouds
    FROM {{ source('demo','WEATHER') }}
),

daily_weather_agg AS (
    SELECT
        dateofweather,
        weather,
        COUNT(*) AS weather_count,
        AVG(pressure) AS avg_pressure,
        AVG(humidity) AS avg_humidity,
        AVG(clouds) AS avg_clouds
    FROM daily_weather
    GROUP BY
        dateofweather,
        weather
    QUALIFY ROW_NUMBER() OVER (
        PARTITION BY dateofweather
        ORDER BY weather_count DESC
    ) = 1
)

SELECT *
FROM daily_weather_agg