with traffic as (
    select * from {{ ref('stg_traffic_announcements') }}
),

weather as (
    select * from {{ ref('weather_forecast_long') }}
),

maintenance as (
    select * from {{ ref('stg_maintenance_routes') }}
)

select
    -- Event Keys
    t.situation_id,
    t.start_time,
    t.announcement_type,
    
    -- Foreign Keys
    t.primary_road_name,
    t.primary_province,
    
    -- Weather Metrics
    w.temperature,
    w.wind_speed,
    w.road_condition,
    
    -- Maintenance Info
    m.domain_name as maintenance_type,
    m.tasks as maintenance_status

from traffic t
left join weather w 
    on t.start_time::date = w.time::date
left join maintenance m 
    on t.primary_road_name = m.route_id::text