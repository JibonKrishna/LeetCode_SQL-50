--Its a easy problem but has to create another table to compare the counts
--Here I have created a table using values. I didnt know that, new thing
-- Write your PostgreSQL query statement below
WITH cte AS(
    SELECT *,
    CASE
        WHEN income <20000 THEN 'Low Salary'
        WHEN income >= 20000 AND income <=50000 THEN 'Average Salary'
        WHEN income > 50000 THEN 'High Salary'
    END AS category
    FROM Accounts
)

SELECT cat.category, COALESCE(COUNT(cte.category),0) AS accounts_count
FROM(VALUES
    ('Low Salary'),
    ('Average Salary'),
    ('High Salary')
)AS cat(category)
LEFT JOIN cte
ON cte.category = cat.category

GROUP BY cat.category


-- SELECT category , COUNT(category) AS accounts_count

-- FROM cte
-- GROUP BY category

