with source as (
    select * from {{ ref('w_data_long_clean') }}
)

select distinct
    w_station_id as station_id,
    w_station_id::text as station_name
from source
where w_station_id is not null