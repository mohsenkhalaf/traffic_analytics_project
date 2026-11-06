with source as (
    select * from {{ ref('w_data_long_clean') }}
),

renamed as (
    select
        w_station_id as station_id,
        w_sensor_id as sensor_id,
        w_sensor_name as sensor_name,
        w_sensor_value as sensor_value,
        w_sensor_unit as sensor_unit,
        cast(w_sensor_measured_time as timestamp) as measured_time,
        is_max_visibility,
        is_out_of_range
    from source
)

select * from renamed