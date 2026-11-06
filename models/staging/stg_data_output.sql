with source as (
    select * from {{ ref('Cleaned_Data_Output') }}
),

renamed as (
    select
        id as sensor_id,
        name as sensor_name,
        short_name,
        unit,
        direction,
        description
    from source
)

select * from renamed