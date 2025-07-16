WITH cte AS(
    SELECT *--st.student_id,st.student_name,su.subject_name, COUNT(e.subject_name) AS attended_exams
    FROM Students st
    CROSS JOIN Subjects su
    ORDER BY 1,3
)

SELECT c.student_id,student_name,c.subject_name,COUNT(e.subject_name) AS attended_exams
FROM cte c
LEFT JOIN Examinations e
ON c.student_id = e.student_id
AND c.subject_name = e.subject_name
GROUP BY c.student_id,student_name,c.subject_name
