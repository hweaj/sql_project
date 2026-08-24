/* Вопрос: Какие самые востребованные навыки для аналитика данных?
Шаги:
-Использовать inner join для вакансий и навыков
-Выделить 5 самых востребованных навыков
-Сгруппировать по навыкам и отсортировать по вакансии
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
