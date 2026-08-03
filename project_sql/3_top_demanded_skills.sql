/* question: what are the most in-demand skills for data analysts?
-join job postings to inner join table similar to query 2
-identify the top-5 in-demand skills for data analysts
-focus on job postings  
*/

SELECT 
    skills,
    count(skills_job_dim.job_id) as demand_count
from job_postings_fact
join skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where job_title_short = 'Data Analyst'
group by skills
ORDER BY demand_count DESC
limit 5