/*
Question ; what are top skills base don salary
-look at the average ssalary associated with each skill for data analyst positions
-Focuses on roles with specified salaries , regardless of location
-Why ? it reveals how different skills imppact salary level for Data analyst and helps identify the most financially rewarding skills to acquire or improve.
*/



SELECT
      skills,
     ROUND( AVG(salary_year_avg)) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
     job_title_short= 'Data Analyst' AND job_work_from_home =TRUE
AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY
      avg_salary DESC
LIMIT 25

/*
Key Trends & Insights

1. Big Data & ML Pipelines Dominate the Top
PySpark, Databricks, Airflow, and DataRobot show that big data and machine learning operations (MLOps) are extremely lucrative.

These tools are used for scalable data processing, modeling, and automation.

2. DevOps & Collaboration Tools Are Valuable
Tools like Bitbucket, GitLab, Jenkins, and Atlassian highlight the rising importance of DevOps practices and collaborative version control in data workflows.

Shows that companies value analysts who can work in production-grade environments.

3. Cloud & Infrastructure-Ready Skills
GCP, Kubernetes, and Linux indicate a strong salary premium for analysts who understand cloud infrastructure and deployment.

Cloud fluency = higher leverage and higher pay.

4. Niche but Valuable Tools
Couchbase, Watson, Twilio, and Notion suggest that specialized platforms (AI services, messaging APIs, productivity tools) can boost earnings when combined with core data skills.

5. Core Libraries Still Hold Value
Pandas, NumPy, Scikit-learn, and Jupyter remain essential — while not always at the top of the salary list, they're consistently valuable.

 Takeaways for 2025 Data Analysts

-Learn beyond Python/SQL: Invest in big data (PySpark) and automation (Airflow, Jenkins).

-Understand the MLOps ecosystem: Tools like DataRobot, Watson, and Databricks are becoming common.

-Be DevOps-aware: Integrate with Git workflows and CI/CD practices.

-Cloud + Containerization is key: Kubernetes and cloud platforms are becoming standard in analyst roles.

-Stack depth pays more than just stack breadth.