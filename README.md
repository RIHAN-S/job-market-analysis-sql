# Introduction 
Dive into the data job market! 📊💼
This project focuses on data analyst roles, exploring the top-paying positions 💰, the most in-demand skills 🔥, and where high demand meets high salary in the world of data analytics 📈.

Curious about the SQL queries? 🧑‍💻 Check them out in the [project_sql](/project_sql/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project marks the beginning of my Data Analysis Career

Data was retrieved from [Luke Barousse's Sql Course](https://www.lukebarousse.com/sql)

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
**SQL** 🧠: The foundation of my analysis, enabling me to query databases and extract meaningful insights.         
 **PostgreSQL** 🗄️: The database management system used to efficiently handle and manage job posting data.          
**Visual Studio Code** 💻: My go-to environment for database management and executing SQL queries seamlessly.       
**Git & GitHub** 🔁: Crucial for version control, project tracking, and sharing my queries, scripts, and analysis to support collaboration.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql 

SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

```

    
# What I Learned

# Conclusions