






/*

SELECT 
    job_schedule_type,
    AVG(salary_year_avg) AS salary_year_avg,
    AVG(salary_hour_avg) AS salary_hour_avg
FROM job_postings_fact
WHERE job_posted_date > '2023-06-01'
GROUP BY job_schedule_type;


    SELECT 
        job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York' AS month,
        COUNT(*) AS job_postings_count
    FROM job_postings_fact
    WHERE job_posted_date >= '2023-01-01' 
    AND job_posted_date < '2024-01-01'
    GROUP BY month
    ORDER BY month;


SELECT 
    EXTRACT(MONTH FROM (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York')) AS month,
    COUNT(*) AS job_postings_count
FROM job_postings_fact
WHERE EXTRACT(YEAR FROM (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York')) = 2023
GROUP BY month
ORDER BY month;





SELECT

    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM job_postings_fact
GROUP BY job_schedule_type

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

*/