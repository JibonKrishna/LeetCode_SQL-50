-- Write your PostgreSQL query statement below
SELECT user_id, count(*) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY 1
