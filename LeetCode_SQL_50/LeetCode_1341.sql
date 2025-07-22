-- Write your PostgreSQL query statement below

WITH most_rated AS(
    SELECT u.name
    FROM MovieRating mr
    LEFT JOIN Users u
    ON mr.user_id = u.user_id
    GROUP BY mr.user_id,u.name
    ORDER BY COUNT(*) DESC,u.name
    LIMIT 1
),
highest_rating AS(
    SELECT m.title
    FROM MovieRating mr
    LEFT JOIN Movies m
    ON m.movie_id = mr.movie_id
    WHERE (EXTRACT(month FROM created_at) = 2) AND (EXTRACT(year FROM created_at) = 2020)  
    GROUP BY m.movie_id,m.title
    ORDER BY AVG(rating) DESC, m.title
    LIMIT 1
)


SELECT
    (SELECT * FROM most_rated) AS results
    UNION ALL
    (SELECT * FROM highest_rating)

