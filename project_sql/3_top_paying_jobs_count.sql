SELECT 
    skills,
    COUNT(skills_job_dim.skill_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title LIKE '%Data%' AND 
    job_location = 'California' AND
    job_health_insurance = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT  10