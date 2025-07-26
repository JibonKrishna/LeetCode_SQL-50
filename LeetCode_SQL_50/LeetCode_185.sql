-- Write your PostgreSQL query statement below
WITH combined AS(
    SELECT e.id As id,e.name As Employee,e.salary,e.departmentId,d.name AS Department,
    DENSE_RANK() OVER(PARTITION BY e.departmentID ORDER BY e.salary DESC) AS rank
    FROM Employee e
    LEFT JOIN Department d
    ON e.departmentID = d.id
)


SELECT department AS Department, employee AS Employee, salary AS salary
FROM combined
WHERE rank <= 3

--I dont know why this problem in the Hard category!!
