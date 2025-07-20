-- Write your PostgreSQL query statement below

SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT *,
    CASE
        WHEN num = LAG(num) OVER(ORDER BY id)
            AND num = LEAD(num) OVER(ORDER BY id) THEN TRUE
    END AS is_cons
    FROM Logs
) as l
WHERE is_cons = TRUE
