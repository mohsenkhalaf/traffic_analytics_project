with source as (
    select * from {{ ref('traffic_message_locations_english_only') }}
),

renamed as (
    select
        id as location_id,
        type as location_type,
        locationcode as location_code,
        subtypecode as subtype_code,
        roadjunction as road_junction,
        roadname as road_name,
        firstname as first_name,
        secondname as second_name,
        arearef as area_ref,
        dataupdatedtime as data_updated_time,
        locationversion as location_version
    from source
)

select * from renamed