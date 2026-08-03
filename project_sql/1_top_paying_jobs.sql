/* question: what are the top-paying data analyst jobs?
-identify the top 10 most payed data analyst roles that are available REMOTELY
-focuses on job postings with specified salaries (remove null)
-why? hihglight the top-paying opportunities for data analyst
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
from job_postings_fact
LEFT JOIN company_dim on company_dim.company_id = job_postings_fact.company_id
where job_title_short = 'Data Analyst' and job_location = 'Anywhere' and salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
limit 10;