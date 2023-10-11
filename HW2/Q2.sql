--Q2, using livesql (Oracle SQL)
WITH SymptomCounts AS (
    SELECT symptom_ID, COUNT(*) AS symptom_count
    FROM Symptom
    GROUP BY symptom_ID
)
SELECT S.symptom_ID, S.symptom_count
FROM SymptomCounts S
WHERE S.symptom_count = (SELECT MAX(symptom_count) FROM SymptomCounts);

SELECT * FROM Symptom;