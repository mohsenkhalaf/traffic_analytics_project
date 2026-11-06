with source as (
    select * from {{ ref('Cleaned_Maintenance_Routes') }}
),

renamed as (
    select
        "properties_id" as route_id,
        "properties_previousId" as previous_id,
        cast("properties_sendingTime" as timestamp) as sending_time,
        cast("properties_startTime" as timestamp) as start_time,
        cast("properties_endTime" as timestamp) as end_time,
        cast("properties_created" as timestamp) as created_at,
        "properties_tasks" as tasks,
        "properties_direction" as direction,
        "properties_domain" as domain_name,
        "properties_source" as source_name,
        geometry_type,
        geometry_coordinates
    from source
)

select * from renamed