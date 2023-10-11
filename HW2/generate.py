import random
import string
import csv


def nameG():
    first_name = random.choice(string.ascii_uppercase) + ''.join(random.sample(string.ascii_lowercase, 4))
    last_name = random.choice(string.ascii_uppercase) + ''.join(random.sample(string.ascii_lowercase, 4))
    return first_name + ' ' + last_name


def insertEmployee(n):
    print('INSERT ALL')
    for i in range(n):
        employee_ID = random.randint(100000, 999999)
        name = nameG()
        office_floor = random.randint(1, 10)
        office_number = str(office_floor) + '0' + str(random.randint(1, 5))
        temp = str(random.randint(1000000000, 9999999999))
        phone_number = temp[:3] + '-' + temp[3:6] + '-' + temp[6:]
        email_address = name[:5] + name[6] + '@hw2.com'

        print(
            '\tINTO Employee (employee_ID, name, office_number, office_floor, phone_number, email_address) VALUES ({}, '
            '\'{}\', \'{}\', {}, \'{}\', \'{}\')'.format(employee_ID, name, office_number, office_floor, phone_number,
                                                         email_address))
    print('SELECT * FROM dual;')
    return


def insertMeeting(n):
    print('INSERT ALL')
    for i in range(n):
        meeting_ID = random.randint(100000, 999999)
        floor_numer = random.randint(1, 10)
        room_number = int(str(floor_numer) + '0' + str(random.randint(1, 3)))
        meeting_start_time = random.randint(8, 18)
        print(
            '\tINTO Meeting (meeting_ID, floor_number, room_number, meeting_start_time) VALUES ({}, {}, {}, {})'.format(
                meeting_ID, floor_numer, room_number, meeting_start_time))
    print('SELECT * FROM dual;')


def insertMA(n):
    print('INSERT ALL')
    with open('download.csv', 'r') as e:
        csvreader = csv.reader(e)
        next(csvreader)
        e_data = []
        for row in csvreader:
            e_data.append(int(row[0]))
    with open('download (1).csv', 'r') as m:
        csvreader = csv.reader(m)
        next(csvreader)
        m_data = []
        for row in csvreader:
            m_data.append([int(row[0]), int(row[1])])
    # print(e_data)
    # print(m_data)
    for i in range(len(m_data)):
        sampled = random.sample(e_data, n)
        for j in range(n):
            print(
                '\tINTO MeetingAttendees (meeting_ID, meeting_start_time, employee_ID) VALUES ({}, {}, {})'.format(
                    m_data[i][0], m_data[i][1], sampled[j]))
    print('SELECT * FROM dual;')


def insertSymptom():
    print('INSERT ALL')
    with open('download.csv', 'r') as e:
        csvreader = csv.reader(e)
        next(csvreader)
        e_data = []
        for row in csvreader:
            e_data.append(int(row[0]))
    num = 0
    for i in range(len(e_data)):
        if random.randint(1, 100) > 70:
            num += 1
            date = '2023-09-' + str(random.randint(1, 30)).zfill(2)
            print(
                '\tINTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES ({}, {}, TO_DATE(\'{}\', \'YYYY-MM-DD\'), {})'.format(
                    num, e_data[i], date, random.randint(1, 5)))
    print('SELECT * FROM dual;')


def insertScan(n):
    print('INSERT ALL')
    with open('download.csv', 'r') as e:
        csvreader = csv.reader(e)
        next(csvreader)
        e_data = []
        for row in csvreader:
            e_data.append(int(row[0]))
    num = 0
    for i in range(n):
        num += 1
        j = random.randint(0, len(e_data) - 1)
        date = '2023-09-' + str(random.randint(1, 31)).zfill(2)
        time = random.randint(0, 23)
        print(
            '\tINTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES ({}, TO_DATE(\'{}\', \'YYYY-MM-DD\'), {}, {}, {})'.format(
                num, date, time, e_data[j], round(random.uniform(96, 101), 2)))
    print('SELECT * FROM dual;')


# insertEmployee(25)
# insertMeeting(15)
# insertMA(3)
# insertSymptom()
# insertScan(10)

