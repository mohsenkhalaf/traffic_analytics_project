with source as (
    select * from {{ ref('stg_sections_wide') }}
)

select distinct
    carriageway as section_id,
    road_number,
    description as road_description,
    length as length_km,
    is_bridge
from source
where carriageway is not null -- استبعاد القيم الفارغة