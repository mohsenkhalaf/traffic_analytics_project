with source as (
    select * from {{ ref('weather_forecast_long') }}
),

renamed as (
    select
        id as forecast_id,
        road_number,
        section_number,
        cast("time" as timestamp) as forecast_time,
        horizon_hours,
        is_forecast,
        road_temperature,
        temperature,
        wind_speed,
        wind_direction,
        overall_road_condition,
        weather_symbol,
        precipitation_condition,
        road_condition,
        is_slippery,
        is_very_slippery,
        section_updated_time
    from source
)

select * from renamed