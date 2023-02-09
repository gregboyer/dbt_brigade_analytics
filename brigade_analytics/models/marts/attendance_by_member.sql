
/*
    Create intermediate data from airtable attendance form data representing the first time someone joined. 
*/

{{ config(materialized='table') }}

with attendance_summary as (
    select *
    from base_attendance_summary
    )

,attendance_first as (
    select *
    from base_attendance_first
    )

,attendance_last as (
    select *
    from base_attendance_last
    )


,results as (
    select
        a.att_email
        ,sum_volunteer_hours
        ,cnt_attendance
        ,cnt_attendance_in_person
        ,cnt_attendance_remote
        ,sum_hours_in_person
        ,sum_hours_remote
        ,att_first_attendance_dt
        ,att_first_location
        ,att_last_attendance_dt
        ,att_last_location
    from attendance_summary a
        inner join attendance_first b
             on a.att_email=b.att_email
        inner join attendance_last c
             on a.att_email=c.att_email
)

select *
from results