/* 
Question what are the most demanded jobs for data analysts?
- join the job postings to inner jpoin table similar to query 2
- identify top  5 in demand skills for a data analyst.
-Focus on all job postings.
-why? Retrieves the top 5 skills with the highest demand in the job market,
    providing insights into yhe most valuable skills for the job seekers.
*/


SELECT 
      skills,
      COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'  AND 
    job_work_from_home = TRUE
GROUP BY
        skills
ORDER BY
       demand_count DESC
LIMIT 5








