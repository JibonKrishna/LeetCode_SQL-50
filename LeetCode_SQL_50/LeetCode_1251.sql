-- Write your PostgreSQL query statement below
SELECT p.product_id, COALESCE(ROUND(SUM((p.price * us.units))/SUM(us.units)::NUMERIC,2),0) AS average_price
FROM Prices p
LEFT JOIN UnitsSold us
ON p.product_id=us.product_id
AND us.purchase_date >= p.start_date AND us.purchase_date <=p.end_date
GROUP BY 1

