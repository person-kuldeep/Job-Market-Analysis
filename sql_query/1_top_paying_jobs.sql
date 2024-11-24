/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT  job_id,
        company_dim.name AS company_name,
        job_title,
        job_schedule_type,
        job_location,
        salary_year_avg,
        job_posted_date::DATE
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home IS TRUE AND
    salary_year_avg IS NOT NULL 
    --salary_year_avg > 80000 AND
    --job_schedule_type = 'Part-time'
ORDER BY salary_year_avg DESC
LIMIT 10;    


-- TOP PAYING DATA ANALYST JOBS

-->1: Top 10 are full time jobs 
-->2: One of the highest paying job is remote job offered by company Mantys for Data Analyst role specificly

--  PART TIME DATA ANALYST JOBS INSIGHTS

-->1: there are very less data analyst jobs that offer part time remote only 2 
-->2: there are 29 data analyst jobs that offer part time onsite
-->3: thare are 11 data analyst jobs that offer part time salary per year over $80000 and 2 of them are remote jobs


