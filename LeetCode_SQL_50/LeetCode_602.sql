-- Write your PostgreSQL query statement below

WITH cte AS(
    SELECT *
    FROM RequestAccepted
),
accepter AS(
    SELECT accepter_id , count(accepter_id) AS accepted_count
    FROM cte
    GROUP BY accepter_id
),
requester AS(
    SELECT requester_id,COUNT(requester_id) FILTER(WHERE accepter_id IS NOT NULL) AS requested_count
    FROM cte
    GROUP BY requester_id
),
combined AS(
    SELECT accepter_id AS id, accepted_count AS count FROM accepter
    UNION ALL
    SELECT requester_id AS id, requested_count AS count FROM requester
)

SELECT id, SUM(count) AS num
FROM combined
GROUP BY id
ORDER BY num DESC
LIMIT 1

--little compact version of previouly coded algo

-- Write your PostgreSQL query statement below

select id, sum(num) as num from (
	select requester_id as id, count(accepter_id) as num from RequestAccepted
	group by requester_id
	union all
	select accepter_id as id, count(accepter_id) as num from RequestAccepted
	group by accepter_id
) as t
group by t.id
order by num desc limit 1;
