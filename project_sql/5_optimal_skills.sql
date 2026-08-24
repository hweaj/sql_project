/* Вопрос: какие навыки оптимальнее всего осваивать для аналитика данных?
Шаги:
-Выделить самые востребованнеы навыки на основе средней зарплаты
-Выделить удаленные вакансии с указанной зарплатой
*/

WITH skills_demand as (
    SELECT
        skills_dim.skill_id, 
        skills_dim.skills,
        count(skills_job_dim.job_id) as demand_count
    from job_postings_fact
    join skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
    where job_title_short = 'Data Analyst' and salary_year_avg IS NOT NULL
    group by skills_dim.skill_id
), average_salary as (
    SELECT
        skills_job_dim.skill_id, 
        round(avg(salary_year_avg), 0) as avg_salary
    from job_postings_fact
    join skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
    where job_title_short = 'Data Analyst' and salary_year_avg IS NOT NULL
    group by skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
from skills_demand
join average_salary on skills_demand.skill_id = average_salary.skill_id
ORDER BY demand_count DESC
limit 25 
