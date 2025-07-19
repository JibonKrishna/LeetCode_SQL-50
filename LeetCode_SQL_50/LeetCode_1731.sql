-- Write your PostgreSQL query statement below
SELECT e2.employee_id,e2.name,COUNT(*) AS reports_count, ROUND(AVG(e.age)) AS average_age
FROM Employees e
INNER JOIN Employees e2
ON  e.reports_to = e2.employee_id
GROUP BY e2.employee_id,e2.name
ORDER BY e2.employee_id
