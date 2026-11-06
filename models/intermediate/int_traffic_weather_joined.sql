with traffic as (
    select * from {{ ref('stg_traffic_announcements') }}
),

weather as (
    select * from {{ ref('weather_forecast_long') }} -- أو stg_weather_forecast لو أنشأته
)

select
    t.situation_id,
    t.situation_type,
    t.announcement_type,
    t.primary_road_name,
    t.primary_province,
    t.start_time,
    w.temperature,
    w.wind_speed,
    w.road_condition,
    w.is_slippery
from traffic t
left join weather w 
    on t.start_time::date = w.time::date