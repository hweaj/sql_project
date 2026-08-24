/* Вопрос: Какие самые нужные навыки, основываясь на зарплате?
-Проанализировать средню зарплату по каждому навыку
-Удалить вакансии с нулевыми значениями зарплаты 
*/

SELECT 
    skills,
    round(avg(salary_year_avg), 0) as avg_salary
from job_postings_fact
join skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where job_title_short = 'Data Analyst' and salary_year_avg IS NOT NULL
group by skills
ORDER BY avg_salary DESC
limit 25
