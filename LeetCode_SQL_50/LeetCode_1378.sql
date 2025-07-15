SELECT unique_id,name
FROM Employees e
LEFT JOIN EmployeeUNI en
ON e.id = en.id

