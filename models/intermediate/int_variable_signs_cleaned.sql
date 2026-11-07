with source as (
    select * from {{ ref('stg_data_output') }}
)

select 
    *
from source