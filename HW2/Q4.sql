--Q4, using livesql (Oracle SQL)
SELECT
    (SELECT COUNT(*) FROM Scan WHERE scan_date BETWEEN start_date AND end_date) AS scan_count,
    (SELECT COUNT(*) FROM Test WHERE test_date BETWEEN start_date AND end_date) AS test_count,
    (SELECT COUNT(DISTINCT employee_ID) FROM Symptom WHERE date_reported BETWEEN start_date AND end_date) AS symptom_report_count,
    (SELECT COUNT(*) FROM Case WHERE case_date BETWEEN start_date AND end_date) AS case_count
FROM
    (SELECT TO_DATE('2023-09-01', 'YYYY-MM-DD') AS start_date, TO_DATE('2023-09-10', 'YYYY-MM-DD') AS end_date FROM DUAL);
