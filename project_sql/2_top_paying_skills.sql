/* Вопрос: Какие навыки требуются для самых оплачиваемых вакансий аналитика данных?
Шаги:
-Взять 10 самых оплачиваемых вакансий из первого запроса
-Добавить навыки которые требуются для них
*/
WITH top_paying_jobs as (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name as company_name
    from job_postings_fact
    LEFT JOIN company_dim on company_dim.company_id = job_postings_fact.company_id
    where job_title_short = 'Data Analyst' and job_location = 'Anywhere' and salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    limit 10
)
SELECT  top_paying_jobs.*,
skills
from top_paying_jobs
join skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg DESC 
