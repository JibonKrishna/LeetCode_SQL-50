SELECT a.machine_id,ROUND(AVG(a2.timestamp - a.timestamp)::NUMERIC,3) AS processing_time
FROM Activity a
LEFT JOIN Activity a2
ON(a.machine_id = a2.machine_id AND
   a.process_id = a2.process_id AND
   a.activity_type = 'start' AND
   a2.activity_type = 'end')

WHERE a2.machine_id IS NOT NULL
GROUP BY a.machine_id
