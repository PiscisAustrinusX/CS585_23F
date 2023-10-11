--Q5, using livesql (Oracle SQL)
WITH PositiveCounts AS (
    SELECT E.office_number, COUNT(*) AS positive_count
    FROM Employee E
    JOIN Test T ON E.employee_ID = T.employee_ID
    WHERE T.test_result = 'positive'
    GROUP BY E.office_number
),
MeetingCounts AS (
    SELECT T.employee_ID, COUNT(distinct ma.meeting_ID) AS meeting_attended
    FROM Test T
    LEFT JOIN MeetingAttendees MA ON T.employee_ID = MA.employee_ID
    WHERE T.test_result = 'positive'
    GROUP BY T.employee_ID
)
SELECT E.employee_ID, MC.meeting_attended, E.office_number, PC.positive_count, (SELECT COUNT(*) FROM Employee WHERE office_number = E.office_number) as employees_in_office
FROM Employee E
JOIN PositiveCounts PC ON E.office_number = PC.office_number
LEFT JOIN MeetingCounts MC ON E.employee_ID = MC.employee_ID
WHERE E.employee_ID IN (SELECT employee_ID FROM Test WHERE test_result = 'positive')
ORDER BY MC.meeting_attended, employees_in_office DESC;
