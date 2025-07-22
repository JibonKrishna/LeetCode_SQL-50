WITH cte AS(
    SELECT employee_id,manager_id
    FROM Employees
    WHERE salary < 30000
)

SELECT DISTINCT employee_id
FROM cte
WHERE  manager_id NOT IN(
    SELECT DISTINCT employee_id
    FROM Employees
    --WHERE e2.employee_id = e.employee_id
)
ORDER BY 1
