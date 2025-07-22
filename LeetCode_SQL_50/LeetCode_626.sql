-- Write your PostgreSQL query statement below
WITH cte AS(
    SELECT *,
    CASE
        WHEN id::NUMERIC % 2 =  0 THEN id::NUMERIC - 1
        WHEN id::NUMERIC % 2 = 1 THEN id::NUMERIC + 1
    END AS new_id
    FROM Seat
),
new AS(
    SELECT new_id,student,ROW_NUMBER() OVER(ORDER BY new_id) AS rn
    FROM cte
    ORDER BY new_id
)


SELECT rn AS id,student
FROM new

