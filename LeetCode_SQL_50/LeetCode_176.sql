-- Write your PostgreSQL query statement below
WITH cte as(
    SELECT *,
    DENSE_RANK() OVER(order by salary DESC) AS rank
    FROM Employee
)

select MAX(salary) AS SecondHighestSalary from cte where rank = 2


-- Another Implementation

-- Write your PostgreSQL query statement below
SELECT (SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1) AS SecondHighestSalary
