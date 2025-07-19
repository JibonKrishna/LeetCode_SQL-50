-- Write your PostgreSQL query statement below
SELECT DISTINCT ON(employee_id) employee_id, department_id 
FROM Employee
ORDER BY
    Employee_id,
    CASE
        WHEN primary_flag = 'Y' THEN 0 ELSE 1 END

