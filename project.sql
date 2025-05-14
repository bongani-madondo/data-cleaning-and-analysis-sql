-- Step 1: Create a unified project status view from two separate tables
WITH project_status AS (
    SELECT 
        project_id,
        project_budget,
        project_name,
        'upcoming' AS status 
    FROM [upcoming projects] 

    UNION ALL

    SELECT
        project_id,
        project_budget,
        project_name, 
        'completed' AS status
    FROM completed_projects
)

-- Step 2: Join employees with departments, project assignments, and project statuses
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    d.Department_Name,
    pa.project_id,
    ps.project_name,
    ps.project_budget,
    ps.status
FROM employees e
JOIN departments d ON e.department_id = d.Department_ID
JOIN project_assignments pa ON pa.employee_id = e.employee_id
JOIN project_status ps ON ps.project_id = pa.project_id;
