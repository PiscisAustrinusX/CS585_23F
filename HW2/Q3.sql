--Q3, using livesql (Oracle SQL)
WITH SickCounts AS (
    SELECT E.office_floor, COUNT(*) AS sick_count
    FROM Employee E
    JOIN Test T ON E.employee_ID = T.employee_ID
    WHERE T.test_result = 'positive'
    GROUP BY E.office_floor
)
SELECT S.office_floor, S.sick_count
FROM SickCounts S
WHERE S.sick_count = (SELECT MAX(sick_count) FROM SickCounts);

SELECT * FROM Test WHERE test_result = 'positive';