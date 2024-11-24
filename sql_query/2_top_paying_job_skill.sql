WITH top_paying_jobs AS (
    SELECT  job_id
           -- company_dim.name AS company_name,
           -- job_title,
           -- job_location,
           -- salary_year_avg
    FROM job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_work_from_home IS TRUE AND
        salary_year_avg IS NOT NULL 
    ORDER BY salary_year_avg DESC
    LIMIT 10 )

SELECT  skills_dim.skills,
        COUNT(top_paying_jobs.job_id) AS most_asked_skills_count
FROM skills_job_dim
--RIGHT JOIN top_paying_jobs ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN top_paying_jobs ON top_paying_jobs.job_id = skills_job_dim.job_id

--LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
-- if not inner join it also show null skill mean where skill is not difined by company
GROUP BY skills_dim.skill_id 
ORDER BY  most_asked_skills_count DESC;

-- the above query shows the top skill from the top paying jobs 
-- this give us insight about the demanding skill in the data analysis market


-- company details raw data 

WITH top_paying_jobs AS (
    SELECT  job_id,
            company_dim.name AS company_name,
            job_title,
            salary_year_avg
    FROM job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_work_from_home IS TRUE AND
        salary_year_avg IS NOT NULL 
    ORDER BY salary_year_avg DESC
    LIMIT 10 )

SELECT  top_paying_jobs.*,
        skills_dim.skills
FROM skills_job_dim
--RIGHT JOIN top_paying_jobs ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN top_paying_jobs ON top_paying_jobs.job_id = skills_job_dim.job_id

--LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

