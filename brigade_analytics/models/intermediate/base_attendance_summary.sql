
/*
    Create intermediate data from airtable attendance form data representing the first time someone joined. 
*/

with source_data as (
    select
        att_email
        ,att_location
        ,att_date
        ,att_volunteer_hours
    from {{ref('stg_airtable_attendance')}}
)
,result as (
    select
        att_email
        ,cast(coalesce(sum(att_volunteer_hours),0) as int) as sum_volunteer_hours
        ,cast(count(att_date) as int) as cnt_attendance
        ,sum(cast(case when att_location='In Person' then 1 else 0 end as int)) as cnt_attendance_in_person
        ,sum(cast(case when att_location<>'In Person' then 1 else 0 end as int)) as cnt_attendance_remote
        ,sum(cast(case when att_location='In Person' then att_volunteer_hours else 0 end as int)) as hours_in_person
        ,sum(cast(case when att_location<>'In Person' then att_volunteer_hours else 0 end as int)) as hours_remote
    from source_data
    group by att_email
    )

select *
from result