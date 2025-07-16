-- Write your PostgreSQL query statement below
SELECT contest_id, ROUND(COUNT(DISTINCT r.user_id)*1.0/COUNT(DISTINCT u.user_id)*100.0,2) AS percentage
FROM Register r
CROSS JOIN Users u
GROUP BY contest_id
ORDER BY 2 DESC,1
