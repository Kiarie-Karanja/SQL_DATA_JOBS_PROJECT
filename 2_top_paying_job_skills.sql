/*
Question; what skills are required for th top paying data analyst jobs
- Use th top 10 highest-paying  Dta analyst jobs from first query.
- ADD specific skills required for these roles
-Why ? It provides a detailed look at which high paying jobs demand certain skills,
  hellping job seekers understand which skills to develop that alighn with top salaries
  */


WITH  top_paying_jobs AS (SELECT
     job_id,
     job_title,
     job_location,
     job_schedule_type,
     job_posted_date,
     salary_year_avg,
     Name AS company_name
FROM 
      job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
       job_title_short ='Data Analyst' AND
       job_location = 'Anywhere' AND 
       salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
)
SELECT *
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
/*

