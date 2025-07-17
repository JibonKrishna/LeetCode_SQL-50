-- Write your PostgreSQL query statement below

WITH cte AS(
    SELECT *,
    event_date - LAG(event_date) OVER(PARTITION BY player_id ORDER BY event_date) AS lagg,
    RANK() OVER(PARTITION BY player_id ORDER BY event_date) as rank
    FROM Activity
)


--SELECT * FROM cte

SELECT ROUND(COUNT(*) FILTER(WHERE lagg = 1 AND rank = 2)::NUMERIC / COUNT(DISTINCT player_id),2) AS fraction

FROM cte
