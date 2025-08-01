-- Write your PostgreSQL query statement below
SELECT product_name,unit
FROM (
    SELECT product_id,SUM(unit) as unit
    FROM Orders
    WHERE EXTRACT(year from order_date) = 2020 
        AND EXTRACT(month from order_date) = 2
    GROUP BY product_id
    ORDER BY product_id
) AS o
INNER JOIN Products p
ON o.product_id = p.product_id
WHERE unit >=100


