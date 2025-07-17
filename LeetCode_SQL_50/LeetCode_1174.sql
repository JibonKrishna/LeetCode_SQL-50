-- Write your PostgreSQL query statement below
--WITH CTE AND WINDOW FUNCTION

WITH cte AS(
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM Delivery
)

SELECT ROUND(100.0* COUNT(*) FILTER(WHERE rn = 1 AND order_date = customer_pref_delivery_date)::numeric/
    COUNT(DISTINCT customer_id),2) AS immediate_percentage

FROM cte


--Without cte and window function , with suquery

SELECT ROUND(100.0* COUNT(*) FILTER(WHERE order_date = customer_pref_delivery_date)::numeric/
    COUNT(DISTINCT customer_id),2) AS immediate_percentage

FROM Delivery
WHERE (customer_id,order_date) IN (
    SELECT customer_id, MIN(order_date)
    FROM Delivery
    GROUP BY customer_id
)
