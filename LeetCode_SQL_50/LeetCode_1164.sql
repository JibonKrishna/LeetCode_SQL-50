WITH cte AS(
    SELECT DISTINCT product_id
    FROM Products
),
aj AS(
    SELECT cte.*,p.new_price,p.change_date
    FROM cte
    LEFT JOIN (
        SELECT *
        FROM Products
        WHERE change_date <= '2019-08-16'::DATE
    ) AS p
    ON cte.product_id = p.product_id
    ORDER BY p.change_date DESC
)

SELECT  DISTINCT ON(product_id)
    product_id,COALESCE(new_price,10) AS price
FROM aj
ORDER BY product_id,change_date DESC
