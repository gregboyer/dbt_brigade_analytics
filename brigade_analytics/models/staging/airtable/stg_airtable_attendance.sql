
/*
    Create staging data from airtable attendance form data
*/

{{ config(materialized='table') }}

with source_data as (

    select
        formula as "att_record_id"
        ,"What brings you here?" as "att_purpose"
        ,"Product Name" as "att_product_key"
        ,"Email" as "att_email"
        ,"Date" as "att_date"
        ,"About how many hours did you volunteer last week? " as "att_volunteer_hours"
        ,"In Person or Remote?" as "att_location"

    from sources.airtable_attendance
)

select *
from source_data

