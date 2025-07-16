-- Write your PostgreSQL query statement below
SELECT s.user_id, 
    ROUND(CASE
        WHEN tot IS NULL THEN 0
        WHEN confirmed = 0 THEN 0
        ELSE confirmed::NUMERIC/tot::NUMERIC
        END , 2) AS confirmation_rate

FROM Signups s
LEFT JOIN(
    SELECT user_id,COUNT(*) AS tot,COUNT(CASE WHEN action = 'confirmed' THEN 1 END) AS confirmed
    FROM Confirmations c
    GROUP BY user_id
) AS c
ON s.user_id = c.user_id
--GROUP BY s.user_id--,c.confirmation_rate
--ORDER BY 2 DESC , 1 DESC


