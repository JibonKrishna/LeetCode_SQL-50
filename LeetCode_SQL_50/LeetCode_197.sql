SELECT w.id
FROM Weather w
LEFT Weather w2
ON w.recorDate -1 = w2.recordDate
WHERE w.temperature > w2.temperature
