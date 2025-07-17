-- Write your PostgreSQL query statement below

SELECT query_name,ROUND(AVG(rating/position::numeric),2) AS quality,
    ROUND(100.0*COUNT(CASE WHEN rating < 3 THEN 1 END)*1.0/COUNT(*),2) AS poor_query_percentage
FROM Queries q
GROUP BY 1


