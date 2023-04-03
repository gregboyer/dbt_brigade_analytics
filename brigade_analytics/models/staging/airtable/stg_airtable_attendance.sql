
/*
    Create staging data from airtable attendance form data
*/

with source_data as
(
    select
        record as "att_record_id"
        ,reason as "att_purpose"
        ,project as "att_product_key"
        ,email as "att_email"
        ,cast(date as date) as "att_date"
        ,cast("volunteerHrsCnt" as int) as "att_volunteer_hours"
        ,location as "att_location"
    from sources.airtable_attendance
)

select *
from source_data

