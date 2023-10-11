--Q1, using livesql (Oracle SQL)
CREATE TABLE Employee (  
    employee_ID INT PRIMARY KEY,   
    name VARCHAR(255),   
    office_number VARCHAR(20),  
    office_floor INT CHECK (office_floor >= 1 AND office_floor <= 10),   
    phone_number VARCHAR(20),   
    email_address VARCHAR(255)
);

CREATE TABLE Meeting (  
    meeting_ID INT PRIMARY KEY, 
    room_number INT,  
    floor_number INT CHECK (floor_number >= 1 AND floor_number <= 10), 
    meeting_start_time INT CHECK (meeting_start_time >= 8 AND meeting_start_time <= 18) 
);

--In order to check the validity of the notification insertion, I add 2 more attributes
--source_ID stands for the contact from whom and source_type stands for the type of contact
CREATE TABLE Notification (
    notification_ID INT PRIMARY KEY,
    employee_ID INT,
    notification_date DATE,
    notification_type VARCHAR(255) CHECK (notification_type IN ('mandatory', 'optional')),
    source_ID INT,
    source_type VARCHAR(255) CHECK (source_type IN ('same office', 'same office floor', 'same meeting', 'same meeting room/floor'))
);

CREATE TABLE Symptom (
    row_ID INT PRIMARY KEY,
    employee_ID INT,
    date_reported DATE,
    symptom_ID INT CHECK (symptom_ID IN (1, 2, 3, 4, 5))
);

CREATE TABLE Scan (
    scan_ID INT PRIMARY KEY,
    scan_date DATE,
    scan_time INT CHECK (scan_time >= 0 AND scan_time <= 23),
    employee_ID INT,
    temperature FLOAT
);

CREATE TABLE Test (
    test_ID INT PRIMARY KEY,
    location VARCHAR(255),
    test_date DATE,
    test_time INT CHECK (test_time >= 0 AND test_time <= 23),
    employee_ID INT,
    test_result VARCHAR(8) CHECK (test_result IN ('positive', 'negative'))
);

CREATE TABLE Case (
    case_ID INT PRIMARY KEY,
    employee_ID INT,
    case_date DATE,
    resolution VARCHAR(255) CHECK (resolution IN ('back to work', 'left the company', 'deceased'))
);

CREATE TABLE HealthStatus (
    row_ID INT PRIMARY KEY,
    employee_ID INT,
    status_date DATE,
    status VARCHAR(255) CHECK (status IN ('sick', 'hospitalized', 'well'))
);

--MeetingAttendees is a table recording every meeting's attendees
CREATE TABLE MeetingAttendees (
    meeting_ID INT,
    employee_ID INT,
    meeting_start_time INT,
	meeting_room_number INT, 
	meeting_floor_number INT,
    PRIMARY KEY (meeting_ID, employee_ID),
    FOREIGN KEY (meeting_ID) REFERENCES Meeting (meeting_ID),
    FOREIGN KEY (employee_ID) REFERENCES Employee (employee_ID)
);

--ToTest is a dynamic table stores employees who will take test
CREATE TABLE ToTest ( 
    employee_ID INT, 
    type INT,  
    test_date date, 
    test_time INT 
);


CREATE SEQUENCE test_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE case_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE notification_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE status_id_seq START WITH 1 INCREMENT BY 1;

--Insert into Employee, data producted by Python code
INSERT ALL
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (405277, 'Vkyxu Pozwe', '903', 9, '352-115-2912', 'VkyxuP@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (636491, 'Hmtfo Vhykq', '905', 9, '412-984-7017', 'HmtfoV@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (760119, 'Sufgk Viedc', '701', 7, '295-399-2635', 'SufgkV@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (232277, 'Fmxcy Ruomv', '605', 6, '323-943-5963', 'FmxcyR@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (479893, 'Gmghl Hxnyq', '604', 6, '478-324-4118', 'GmghlH@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (250945, 'Lysji Xxwtg', '703', 7, '674-170-9923', 'LysjiX@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (260340, 'Vfqxw Qlnaw', '104', 1, '118-219-6649', 'VfqxwQ@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (838714, 'Sqyhe Ixmek', '1003', 10, '139-693-6163', 'SqyheI@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (572383, 'Rnubd Viqmt', '1002', 10, '398-061-0901', 'RnubdV@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (834253, 'Gnbwz Fezvf', '503', 5, '578-461-6063', 'GnbwzF@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (902540, 'Urbcw Abokv', '205', 2, '562-060-4644', 'UrbcwA@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (196297, 'Etfxp Lrjes', '701', 7, '191-272-8829', 'EtfxpL@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (589893, 'Fhmxl Jzqpy', '201', 2, '738-021-5468', 'FhmxlJ@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (787440, 'Esnyo Hsypu', '603', 6, '704-992-2646', 'EsnyoH@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (869519, 'Lvlpg Hhzyr', '103', 1, '862-545-3582', 'LvlpgH@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (567911, 'Yaxir Tjzmv', '102', 1, '531-069-0949', 'YaxirT@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (310588, 'Omzna Jludi', '201', 2, '472-864-4006', 'OmznaJ@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (879065, 'Ndbza Ltkau', '502', 5, '491-391-9189', 'NdbzaL@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (368077, 'Vdefw Uaglj', '304', 3, '988-150-0416', 'VdefwU@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (526153, 'Zqigm Ebmhe', '1001', 10, '199-454-7209', 'ZqigmE@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (475597, 'Jxjak Nuhqv', '201', 2, '218-817-8936', 'JxjakN@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (508750, 'Ftrsl Hrkno', '203', 2, '282-997-8637', 'FtrslH@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (568560, 'Fjyzu Mprbu', '504', 5, '365-898-1932', 'FjyzuM@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (580602, 'Pmrot Xseqk', '304', 3, '467-612-3569', 'PmrotX@hw2.com')
	INTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES (466917, 'Whfqy Qxfwl', '702', 7, '784-967-6662', 'WhfqyQ@hw2.com')
SELECT * FROM dual;

--Insert into Meeting, data producted by Python code
INSERT ALL
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (216391, 2, 201, 8)
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (976217, 10, 1002, 14)
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (511711, 4, 401, 9)
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (110917, 10, 1003, 17)
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (744948, 9, 901, 14)
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (855060, 7, 702, 13)
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (968473, 4, 403, 11)
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (585424, 1, 101, 14)
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (830103, 1, 103, 11)
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (843510, 5, 502, 18)
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (654382, 9, 902, 17)
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (332572, 3, 302, 10)
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (564269, 8, 801, 9)
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (791055, 3, 301, 11)
	INTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES (196890, 6, 602, 15)
SELECT * FROM dual;

--Insert into MeetingAttendees, data producted by Python code
INSERT ALL
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (216391, 8, 838714)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (216391, 8, 508750)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (216391, 8, 368077)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (976217, 14, 466917)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (976217, 14, 250945)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (976217, 14, 869519)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (511711, 9, 760119)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (511711, 9, 250945)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (511711, 9, 232277)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (110917, 17, 368077)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (110917, 17, 787440)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (110917, 17, 869519)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (744948, 14, 834253)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (744948, 14, 310588)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (744948, 14, 902540)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (855060, 13, 787440)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (855060, 13, 368077)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (855060, 13, 879065)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (968473, 11, 310588)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (968473, 11, 902540)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (968473, 11, 250945)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (585424, 14, 232277)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (585424, 14, 508750)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (585424, 14, 572383)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (830103, 11, 787440)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (830103, 11, 250945)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (830103, 11, 310588)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (843510, 18, 902540)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (843510, 18, 508750)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (843510, 18, 589893)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (654382, 17, 838714)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (654382, 17, 572383)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (654382, 17, 869519)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (332572, 10, 250945)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (332572, 10, 580602)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (332572, 10, 260340)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (564269, 9, 869519)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (564269, 9, 879065)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (564269, 9, 475597)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (791055, 11, 879065)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (791055, 11, 368077)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (791055, 11, 838714)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (196890, 15, 232277)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (196890, 15, 508750)
	INTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES (196890, 15, 475597)
SELECT * FROM dual;


--To avoid one employee attending multiple meetings for test data, won't happen in real world
DELETE FROM MeetingAttendees
WHERE meeting_ID = 830103 AND employee_ID = 310588;
INSERT INTO MeetingAttendees (meeting_ID, employee_ID, meeting_start_time)
VALUES (830103, 580602, 11);

DELETE FROM MeetingAttendees
WHERE meeting_ID = 968473 AND employee_ID = 250945;
INSERT INTO MeetingAttendees (meeting_ID, employee_ID, meeting_start_time)
VALUES (968473, 232277, 11);

DELETE FROM MeetingAttendees
WHERE meeting_ID = 110917 AND employee_ID = 869519;
INSERT INTO MeetingAttendees (meeting_ID, employee_ID, meeting_start_time)
VALUES (110917, 508750, 17);

--Add the information of meeting location, for further notification
UPDATE MeetingAttendees
SET (meeting_room_number, meeting_floor_number) = (
    SELECT room_number, floor_number
    FROM Meeting
    WHERE Meeting.meeting_ID = MeetingAttendees.meeting_ID
);

--Check
SELECT * FROM Employee;
SELECT * FROM Meeting;
SELECT * FROM MeetingAttendees ORDER BY meeting_start_time, employee_ID;


--insert the data of Symptom
INSERT ALL
	INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (1, 250945, TO_DATE('2023-09-23', 'YYYY-MM-DD'), 5)
	INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (2, 405277, TO_DATE('2023-09-04', 'YYYY-MM-DD'), 5)
	INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (3, 508750, TO_DATE('2023-09-08', 'YYYY-MM-DD'), 2)
	INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (4, 526153, TO_DATE('2023-09-09', 'YYYY-MM-DD'), 4)
	INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (5, 567911, TO_DATE('2023-09-21', 'YYYY-MM-DD'), 2)
	INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (6, 787440, TO_DATE('2023-09-27', 'YYYY-MM-DD'), 2)
	INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (7, 834253, TO_DATE('2023-09-02', 'YYYY-MM-DD'), 3)
SELECT * FROM dual;

--insert the data of Scan
INSERT ALL
	INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (1, TO_DATE('2023-09-15', 'YYYY-MM-DD'), 23, 196297, 97.57)
	INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (2, TO_DATE('2023-09-13', 'YYYY-MM-DD'), 4, 368077, 96.57)
	INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (3, TO_DATE('2023-09-22', 'YYYY-MM-DD'), 12, 405277, 97.12)
	INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (4, TO_DATE('2023-09-20', 'YYYY-MM-DD'), 13, 479893, 99.4)
	INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (5, TO_DATE('2023-09-15', 'YYYY-MM-DD'), 18, 567911, 99.4)
	INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (6, TO_DATE('2023-0903', 'YYYY-MM-DD'), 6, 838714, 98.66)
	INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (7, TO_DATE('2023-09-16', 'YYYY-MM-DD'), 11, 787440, 100.46)
	INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (8, TO_DATE('2023-09-22', 'YYYY-MM-DD'), 5, 232277, 98.43)
	INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (9, TO_DATE('2023-09-11', 'YYYY-MM-DD'), 5, 479893, 99.61)
	INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (10, TO_DATE('2023-09-02', 'YYYY-MM-DD'), 6, 475597, 100.25)
SELECT * FROM dual;

--Employees with high temperature from scan will take the test at company immediately
INSERT INTO ToTest (employee_ID, test_date, test_time, type) 
SELECT employee_ID, scan_date, scan_time, 0
FROM Scan
WHERE temperature >= 99.50;
--Employees with self-reporting symptom will take the test that night at any location
INSERT INTO ToTest (employee_ID, test_date, test_time, type) 
SELECT employee_ID, date_reported, 23, 1
FROM Symptom;
SELECT * FROM Scan;
SELECT * FROM Symptom;

DELETE FROM ToTest t1
WHERE EXISTS (
    SELECT 1
    FROM ToTest t2
    WHERE t2.employee_ID = t1.employee_ID AND
          (t2.test_date > t1.test_date OR
          (t2.test_date = t1.test_date AND t2.test_time > t1.test_time))
);

--Test of Scan
INSERT INTO Test (location, test_date, test_time, employee_ID, test_ID, test_result)
SELECT 'Company', test_date, test_time, employee_ID, test_id_seq.NEXTVAL, 
    CASE 
        WHEN DBMS_RANDOM.VALUE < 0.25 THEN 'positive'
        ELSE 'negative'
    END
FROM ToTest
WHERE type = 0;
--Test of Symptom
INSERT INTO Test (location, test_date, test_time, employee_ID, test_ID, test_result)
SELECT
    CASE 
        WHEN DBMS_RANDOM.VALUE < 0.25 THEN 'company'
        WHEN DBMS_RANDOM.VALUE < 0.5 THEN 'hospital'
        WHEN DBMS_RANDOM.VALUE < 0.75 THEN 'clinic'
        ELSE 'home'
    END,
    test_date,
    test_time,
    employee_ID,
    test_id_seq.NEXTVAL, 
    CASE 
        WHEN DBMS_RANDOM.VALUE < 0.8 THEN 'positive'
        ELSE 'negative'
    END
FROM ToTest
WHERE type = 1;

--The ToTest table is a table to record employees going to take test, if tested, the record will be deleted
DELETE FROM ToTest;

--Add positive employees into Case
INSERT INTO Case (case_ID, employee_ID, case_date, resolution)
SELECT case_id_seq.NEXTVAL, employee_ID, test_date, 
	CASE
		WHEN DBMS_RANDOM.VALUE < 0.99 THEN 'left the company'
		ELSE 'deceased'
    END
FROM Test
WHERE test_result = 'positive';

--Create notifications to related employees
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type, source_ID, source_type)
SELECT notification_id_seq.NEXTVAL, E2.employee_ID, T.test_date, 'mandatory',  T.employee_ID, 'same office'
FROM Test T
JOIN Employee E1 ON T.employee_ID = E1.employee_ID
JOIN Employee E2 ON E1.office_number = E2.office_number
WHERE T.test_result = 'positive' AND E2.employee_ID <> E1.employee_ID;

INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type, source_ID, source_type)
SELECT notification_id_seq.NEXTVAL, E2.employee_ID, T.test_date, 'optional', T.employee_ID, 'same office floor'
FROM Test T
JOIN Employee E1 ON T.employee_ID = E1.employee_ID
JOIN Employee E2 ON E1.office_floor = E2.office_floor AND E1.office_number <> E2.office_floor
WHERE T.test_result = 'positive' AND E2.employee_ID <> E1.employee_ID;


INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type, source_ID, source_type)
SELECT notification_id_seq.NEXTVAL, MA2.employee_ID, T.test_date, 'mandatory', T.employee_ID, 'same meeting'
FROM Test T
JOIN MeetingAttendees MA1 ON T.employee_ID = MA1.employee_ID
JOIN MeetingAttendees MA2 ON MA1.meeting_room_number = MA2.meeting_room_number
WHERE T.test_result = 'positive' AND MA2.employee_ID <> MA1.employee_ID;

INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type, source_ID, source_type)
SELECT notification_id_seq.NEXTVAL, MA2.employee_ID, T.test_date, 'optional', T.employee_ID, 'same meeting room/floor'
FROM Test T
JOIN MeetingAttendees MA1 ON T.employee_ID = MA1.employee_ID
JOIN MeetingAttendees MA2 ON MA1.meeting_floor_number = MA2.meeting_floor_number AND MA1.meeting_ID <> MA2.meeting_ID AND MA1.meeting_start_time <= MA2.meeting_start_time
WHERE T.test_result = 'positive' AND MA2.employee_ID <> MA1.employee_ID;

--Positive employee do not need to be noticed again
DELETE FROM Notification
WHERE employee_ID IN (SELECT employee_ID FROM Test WHERE test_result = 'positive');

--Just for inspection
SELECT * FROM test WHERE test_result = 'positive';
SELECT * FROM notification;
SELECT * FROM Case;

--This is one-time trace for related employee, once noticed, mandatory employees must take test and optional employees may take test at 8 am next day
--Can use this multiple times
INSERT INTO ToTest (employee_ID, test_date, test_time, type)
SELECT employee_ID, notification_date, 23, 1
FROM Notification
WHERE (notification_type = 'mandatory' OR (notification_type = 'optional' AND DBMS_RANDOM.VALUE < 0.7));

DELETE FROM ToTest t1
WHERE EXISTS (
    SELECT 1
    FROM ToTest t2
    WHERE t2.employee_ID = t1.employee_ID AND
          (t2.test_date > t1.test_date OR
          (t2.test_date = t1.test_date AND t2.test_time >= t1.test_time))
);

INSERT INTO Test (location, test_date, test_time, employee_ID, test_ID, test_result)
SELECT 
    CASE 
        WHEN DBMS_RANDOM.VALUE < 0.25 THEN 'company'
        WHEN DBMS_RANDOM.VALUE < 0.5 THEN 'hospital'
        WHEN DBMS_RANDOM.VALUE < 0.75 THEN 'clinic'
        ELSE 'home'
    END,
    test_date,
    test_time,
    employee_ID,
    test_id_seq.NEXTVAL, 
    CASE 
        WHEN DBMS_RANDOM.VALUE < 0.8 THEN 'positive'
        ELSE 'negative'
    END
FROM ToTest;

DELETE FROM ToTest;

INSERT INTO Case (case_ID, employee_ID, case_date, resolution)
SELECT case_id_seq.NEXTVAL, T.employee_ID, T.test_date, 
    CASE
        WHEN DBMS_RANDOM.VALUE < 0.99 THEN 'left the company'
        ELSE 'deceased'
    END
FROM Test T
WHERE T.test_result = 'positive'
AND NOT EXISTS (
    SELECT 1 
    FROM Case C
    WHERE C.employee_ID = T.employee_ID AND C.case_date = T.test_date
);

SELECT * FROM Case;

--Update everyday, if deceased, no need to insert
INSERT INTO HealthStatus (row_ID, employee_ID, status_date, status)
SELECT status_id_seq.NEXTVAL, employee_ID, SYSDATE, 
	CASE
		WHEN DBMS_RANDOM.VALUE < 0.5 THEN 'well'
		WHEN DBMS_RANDOM.VALUE < 0.9 THEN 'sick'
		ELSE 'hospitalized'
	END
FROM Case
WHERE resolution = 'left the company';

SELECT * FROM HealthStatus;

--If well 14 days afterward, employee can back to work and no longer need to report health status
UPDATE Case
SET resolution = 'back to work'
WHERE EXISTS (
    SELECT * FROM HealthStatus
    WHERE Case.employee_ID = HealthStatus.employee_ID
    AND HealthStatus.status = 'well' AND status_date - case_date >= 14
);

SELECT * FROM Case;