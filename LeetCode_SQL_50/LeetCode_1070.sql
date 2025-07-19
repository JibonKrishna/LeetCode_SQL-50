-- Write your PostgreSQL query statement below
SELECT product_id,year AS first_year,quantity,price
FROM (
    SELECT product_id,year,quantity,price,
    DENSE_RANK() OVER(partition by product_id ORDER BY year) AS rank
    FROM Sales
)
WHERE rank = 1


