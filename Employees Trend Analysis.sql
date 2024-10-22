----Show the table----- 
SELECT 
    *
FROM
    emp_trends.`analyzing employee trends`;

-- Count the number of employees in each department--- 
SELECT 
    department, COUNT(*) AS employees_count
FROM
    emp_trends.`analyzing employee trends` AS emp_trends
GROUP BY department;

-- Calculate the average age for each department ---

SELECT 
    department, AVG(age) AS average_age
FROM
    emp_trends.`analyzing employee trends`
GROUP BY department;

-- Identify the most common job roles in each department ----- 

SELECT 
    department, job_role, COUNT(*) AS role_count
FROM
    emp_trends.`analyzing employee trends`
GROUP BY department , job_role
ORDER BY department , role_count DESC;

SELECT 
    education,
    ROUND(AVG(job_satisfaction), 2) AS average_satisfaction
FROM
    emp_trends.`analyzing employee trends`
GROUP BY education;

-- Determine the average age for employees with different levels of job satisfaction ---
SELECT 
    job_satisfaction, AVG(age) AS average_age
FROM
    emp_trends.`analyzing employee trends`
GROUP BY job_satisfaction ;

--  Calculate the attrition rate for each age band --
SELECT 
    age_band,
    SUM(CASE
        WHEN attrition = 'YES' THEN 1
        ELSE 0
    END) / COUNT(*) * 100 AS attrition_rate
FROM
    emp_trends.`analyzing employee trends`
GROUP BY age_band;

-- Identify the departments with the highest and lowest average job satisfaction ---

SELECT 
    department, AVG(job_satisfaction) AS average_satisfaction
FROM
    emp_trends.`analyzing employee trends`
GROUP BY department
ORDER BY average_satisfaction DESC , department
LIMIT 1;

-- Find the age band with the highest attrition rate among employees with a specific education level---

select education, age_band, sum(case when attrition = 'YES' then 1 else 0 end) / count(*) * 100 as attrition_rate
from emp_trends.`analyzing employee trends`
group by education, age_band
order by attrition_rate desc
limit 1;

-- Find the education level with the highest average job satisfaction among employees who travel frequently ---

select education, avg(job_satisfaction) as average_satisfaction
from emp_trends.`analyzing employee trends`
where business_travel = 'Travel_frequently'
group by education
order by average_satisfaction desc
limit 5;
