
/*
    Create staging data from airtable members form data
*/

with source_data as (

    select
        "fullName" as memb_full_name
        ,email as memb_email
        ,timestamp as memb_timestamp
        ,channel as memb_referral
        ,goals as memb_goal
        ,"involvementTypes" as memb_involvement_type
        ,"linkedIn" as memb_linkedin_url
        ,profession as memb_profession
        ,company as memb_company
        ,roles as memb_role_list
        ,skills as memb_tech_list
        ,"Areas of Interest" as memb_interest_list
        ,"experienceLevel" as memb_exp_level
        ,gender as memb_gender
        ,"raceEthnicity" as memb_race_ethnicity
        ,income as memb_income_range
        ,"ageRange" as memb_age_range
    from sources.airtable_members
)

select *
from source_data

