with source as (
    select * from {{ ref('sections_wide') }}
),

renamed as (
    select
        id as section_id,
        road_number,
        road_section_number,
        description,
        is_bridge,
        length,
        carriageway,
        n_segments,
        lon_center,
        lat_center,
        geometry_wkt
    from source
)

select * from renamed