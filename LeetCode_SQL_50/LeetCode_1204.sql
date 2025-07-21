-- Write your PostgreSQL query statement below
WITH cte AS(
    SELECT *,
    SUM(weight) OVER(
        ORDER BY turn
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS rolling_sum
    FROM Queue
)
select person_name
FROM cte
WHERE rolling_sum <= 1000
ORDER BY turn DESC
limit 1


