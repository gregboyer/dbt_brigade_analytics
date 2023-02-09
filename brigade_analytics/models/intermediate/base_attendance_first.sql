
/*
    Create intermediate data from airtable attendance form data representing the first time someone joined. 
*/

{{ config(materialized='table') }}

with source_data as (
    select
        att_email
        ,att_location
        ,att_date
        ,att_volunteer_hours

    from public.stg_airtable_attendance
)

,first_attendance as (
    select
        att_email
        ,min(att_date) att_date
    from public.stg_airtable_attendance
    group by att_email
)
,result as (
    select
        a.att_email
        ,a.att_location as att_first_location
        ,b.att_date as att_first_attendance_dt
    from source_data a
        inner join first_attendance b
        on a.att_email=b.att_email
        and a.att_date=b.att_date

)

select *
from result