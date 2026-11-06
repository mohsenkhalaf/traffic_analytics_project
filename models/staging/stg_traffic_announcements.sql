with source as (
    select * from {{ ref('Cleaned_Traffic_Announcements') }}
),

renamed as (
    select
        "prop_situationId" as situation_id,
        "prop_situationType" as situation_type,
        "prop_trafficAnnouncementType" as announcement_type,
        "prop_version" as version_no,
        
        cast("prop_releaseTime" as timestamp) as release_time,
        cast("prop_versionTime" as timestamp) as version_time,
        cast("ann_timeAndDuration_startTime" as timestamp) as start_time,
        cast("ann_timeAndDuration_endTime" as timestamp) as end_time,
        
        "ann_language" as lang,
        "ann_title" as title,
        "ann_location_description" as location_description,
        
        "loc_primaryPoint_roadName" as primary_road_name,
        "loc_primaryPoint_municipality" as primary_municipality,
        "loc_primaryPoint_province" as primary_province,
        
        "ann_sender" as sender,
        "prop_contact_phone" as contact_phone,
        "prop_contact_email" as contact_email,
        
        geometry_type,
        geometry_coordinates

    from source
)

select * from renamed