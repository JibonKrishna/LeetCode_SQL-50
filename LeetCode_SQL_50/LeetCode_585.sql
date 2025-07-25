-- Write your PostgreSQL query statement below

--sum of all total investment values in 2016 tiv_2016
-- FOR,who have the same tiv_2015 value as one or more other policyholders
--are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique)
--Round tiv_2016 to two decimal places.

WITH locs AS(
    SELECT *,CONCAT(lat,',',lon) AS location
    FROM Insurance
),
unique_locs AS(
    SELECT pid,location
    FROM locs
    WHERE location IN(
        SELECT location
        FROM locs
        GROUP BY location
        HAVING COUNT(location) = 1
    )
),
tivs AS(
    SELECT pid,tiv_2015,tiv_2016,
    COUNT(*) OVER(PARTITION BY tiv_2015) AS count
    FROM Insurance
),
no_unique_tivs AS(
    SELECT pid--,tiv_2015,2016
    FROM tivs
    WHERE count >1
)

SELECT ROUND(SUM(tiv_2016::NUMERIC),2) AS tiv_2016
FROM Insurance
WHERE pid IN(
    SELECT pid FROM unique_locs 
    INTERSECT
    SELECT pid FROM no_unique_tivs
)


-- this solution is N(LOG N) , We can improve it a bit by using joins instead of Intersect
--O(N) solution is possible if JOIN and GROUP BY is hashed
