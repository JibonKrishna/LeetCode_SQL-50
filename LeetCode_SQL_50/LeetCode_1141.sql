-- Write your PostgreSQL query statement below 
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-07-27'::DATE - 29 AND '2019-07-27'::DATE 
GROUP BY activity_date

--CORNER CASE
--We have to subtract 29 days instead of 30 days, because in the problem statement
--its mentioned about the ending day, so the ending day is included, thats why
