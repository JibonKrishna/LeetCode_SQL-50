-- Write your PostgreSQL query statement below
 SELECT TO_CHAR(trans_date,'YYYY-MM')AS month,
    country,
    COALESCE(COUNT(*),0) AS trans_count,
    COALESCE(COUNT(*) FILTER(WHERE state = 'approved'),0) AS approved_count,
    COALESCE(SUM(amount),0) AS trans_total_amount,
    COALESCE(SUM(amount) FILTER(WHERE state = 'approved'),0) AS approved_total_amount

 FROM Transactions t
 GROUP BY country,TO_CHAR(
    trans_date,'YYYY-MM'
 )

--ORDER BY country DESC,month
