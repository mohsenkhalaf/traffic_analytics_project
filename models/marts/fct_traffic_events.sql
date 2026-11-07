with traffic as (
    select * from {{ ref('int_traffic_weather_joined') }}
),

maintenance as (
    select * from {{ ref('int_maintenance_cleaned') }}
),

variable_signs as (
    select * from {{ ref('int_variable_signs_cleaned') }}
)

select
    t.*
from traffic t
