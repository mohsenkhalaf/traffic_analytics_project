with source as (
    select * from {{ ref('stg_maintenance_routes') }}
)

select 
    *
from source