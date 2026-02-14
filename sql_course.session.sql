/*

SELECT 
    job_title_short AS TITLE,
    job_location AS LOCATION,
    job_posted_date::DATE AS DATE
FROM job_postings_fact



SELECT 
    job_title_short AS TITLE,
    job_location AS LOCATION,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS DATE_TIME
FROM job_postings_fact
LIMIT 10



SELECT 
    job_title_short AS TITLE,
    job_location AS LOCATION,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS DATE_TIME,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM job_postings_fact
LIMIT 10


CREATE TABLE january_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

   
CREATE TABLE february_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;


SELECT 
    COUNT(job_id) AS no_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite' 
    END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category

    
--Subqueries

    SELECT name,company_id 
    FROM company_dim
    WHERE company_id IN (

    SELECT company_id
     FROM job_postings_fact
     WHERE job_no_degree_mention = true
     ORDER BY company_id
)
 

--CTE

WITH company_job_count AS(
    SELECT 
        company_id,
        COUNT(*) AS total_jobs
    FROM job_postings_fact  
    GROUP BY company_id
)

SELECT 
    name AS company_name,
    company_job_count.total_jobs
FROM company_dim 
    LEFT JOIN company_job_count 
    ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC





WITH company_job_count AS 
(
    SELECT 
        company_id,
        COUNT(*) AS total_no_jobs 
    FROM   
        job_postings_fact
    GROUP BY 
        company_id 
)

SELECT 
name,
company_job_count.total_no_jobs
FROM company_dim
LEFT JOIN company_job_count 
ON company_job_count.company_id = company_dim.company_id 
ORDER BY company_job_count.total_no_jobs DESC


*/

WITH cte_table AS (
SELECT
    skill_id,
    COUNT(*) AS skill_count
FROM skills_job_dim AS no_of_skills
INNER JOIN job_postings_fact ON job_postings_fact.job_id = no_of_skills.job_id
WHERE
    job_postings_fact.job_work_from_home = TRUE AND
    job_postings_fact.job_title_short = 'Data Analyst' 
GROUP BY skill_id
)

SELECT 
skills_dim.skill_id,
skills_dim.skills as Skill_required,
skill_count
FROM cte_table
INNER JOIN skills_dim ON skills_dim.skill_id = cte_table.skill_id
ORDER BY skill_count DESC
LIMIT 5



