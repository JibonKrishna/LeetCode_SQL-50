-- Write your PostgreSQL query statement below
WITH cte AS(
    SELECT visited_on,SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
    ORDER BY visited_on
),
final AS(
    SELECT visited_on,
    CASE WHEN COUNT(*) OVER(
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) = 7 
    THEN(
        SUM(amount) OVER(
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        )
    )END AS rolling_sum,
    CASE WHEN COUNT(*) OVER(
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) = 7 
    THEN(
        AVG(amount) OVER(
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        )
    )END AS rolling_average
    
    FROM cte
    ORDER BY visited_on
)
SELECT visited_on,rolling_sum AS amount,ROUND(rolling_average,2) AS average_amount
FROM final
WHERE rolling_sum IS NOT NULL



--Here is a different implementation wihout the case statement
-- Write your PostgreSQL query statement below
WITH cte AS(
    SELECT visited_on,SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
    ORDER BY visited_on
),
final AS(
    SELECT visited_on,

    COUNT(*) OVER (
      ORDER BY visited_on
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS rolling_days,
    SUM(amount) OVER(
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    )AS rolling_sum,

    AVG(amount) OVER(
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    )AS rolling_average

    FROM cte
    ORDER BY visited_on
)
SELECT visited_on,rolling_sum AS amount,ROUND(rolling_average,2) AS average_amount
FROM final
WHERE rolling_days = 7
--ORDER BY visited_on

--current day + 6 days before
--Order by visited_on
