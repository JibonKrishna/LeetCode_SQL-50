-- Write your PostgreSQL query statement below
WITH cte as(
    SELECT *,
    DENSE_RANK() OVER(order by salary DESC) AS rank
    FROM Employee
)

select MAX(salary) AS SecondHighestSalary from cte where rank = 2
