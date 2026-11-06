with source as (
    select * from {{ ref('traffic_message_locations_ty_english_only') }}
),

renamed as (
    select
        -- الأعمدة تظهر مفصولة في جدول الـ seed بسبب الفاصلة
        "id;subtypecode;descriptionen" as raw_data
    from source
)

select * from renamed