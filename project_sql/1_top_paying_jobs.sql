/* Какой вопрос решается?: Самые высокоплачиваемые вакансии аналитика данных
Шаги:
-Найти топ-10 самых оплачиваемых вакансий аналитика данных, которые доступны для удаленной работы
-Сфокусироваться на вакансиях с указанной заработной платой (удалить нулевые значения)
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
