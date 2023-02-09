
/*
    Create staging data from airtable members form data
*/

{{ config(materialized='table') }}

with source_data as (

    select
        "Full Name" as memb_full_name
        ,"Email" as memb_email
        ,"Timestamp" as memb_timestamp
        ,"How did you find us?" as memb_referral
        ,"What brought you to Code for San Francisco?" as memb_goal
        ,"How do you want to get involved? " as memb_involvement_type
        ,"Would you like to share your LinkedIn URL?" as memb_linkedin_url
        ,"What is your profession?" as memb_profession
        ,"Where do you work?" as memb_company
        ,"What roles are you interested in at Code for San Francisco? " as memb_role_list
        ,"Tech Stack" as memb_tech_list
        ,"Areas of Interest" as memb_interest_list
        ,"Experience Level" as memb_exp_level
        ,"Gender" as memb_gender
        ,"Race/Ethnicity" as memb_race_ethnicity
        ,"Income" as memb_income_range
        ,"Age Range" as memb_age_range
    from sources.airtable_members
)

select *
from source_data

