-- Identify the age band with the highest average job satisfaction among married employees ----

select age_band, avg(job_satisfaction) as average_satisfaction
from emp_trends.`analyzing employee trends`
where marital_status = 'Married'
group by age_band
order by average_satisfaction desc
limit 1;