/*
Patient_Monthly_Statement:
    Any patient who has an unpaid balance receives a statement that is compiled at the end of each month, listing all the 
    services provided that month, any payments received, and the balance due.
Operating_Room_Schedule: 
    This schedule provides information about all scheduled surgeries for the day.
Operating_Room_Log: 
    This records information about the surgeries actually performed on a given day, including identification of the patient, 
    surgeon, and nurse, and notations and observations about the surgery.
Daily_Delivery_Room_Log: 
    This records information about all the deliveries performed each day.
Recovery Room Log:
    This report records information about the use of the recovery room, including the patient’s name, attending practitioner, 
    bed, date in, time in, date out, time out, and signature of the practitioner who signs the patient out. A nurse records the 
    times and results of any medical checks performed while the patient is in recovery.
Monthly_Activity_Report: 
    This is an internal report summarizing the clinic’s activity each month. It shows such items as the number of visits 
    conducted by each provider, the number of surgeries performed, the number of deliveries, the number of lab tests broken down 
    by type, the number of prescriptions dispensed, the average time per visit, and so on.
    
Jake's Thoughts
    We might want to make these full tables with a bunch of foeign keys as far as I am concered 
*/
DROP VIEW patient_monthly_statement;

DROP VIEW operating_room_schedule;

DROP VIEW operating_room_log;
--Jake

CREATE VIEW patient_monthly_statement AS
    SELECT
        pe.name            patient_name,
        pe.phonenum        phonenum,
        b.bill_price       bill_price,
        b.bill_date        appointment_date,
        b.bill_treatment   treatment,
        ( b.bill_price - b.amountpaid ) balance_owed
    FROM
        bill b
        INNER JOIN patient p ON p.patient_id = b.patient_id
        INNER JOIN person pe ON pe.person_id = p.person_id
    WHERE
        ( b.bill_price - b.amountpaid ) > 0;

--Jake

CREATE VIEW operating_room_schedule AS
    SELECT
        room.room_type     room_type,
        visit.start_time   start_time,
        visit.end_time     end_time,
        visit.reason       treatment
    FROM
        or_room_schedule
        INNER JOIN room ON or_room_schedule.room_id = room.room_id
        INNER JOIN visit ON or_room_schedule.visit_id = visit.visit_id
    WHERE
        room.room_type = 'Operating Room' and (visit.start_time > TIMESTAMP '2012-12-12 00:00:00' and visit.start_time < TIMESTAMP '2012-12-12 23:59:00' );

--Jake
/*
Operating_Room_Log: 
    This records information about the surgeries actually performed on a given day, including identification of the patient, 
    surgeon, and nurse, and notations and observations about the surgery.
*/

CREATE VIEW operating_room_log AS
    SELECT
        room.room_type               room_type,
        visit.start_time             start_time,
        visit.end_time               end_time,
        visit.reason                 treatment,
        patient.patient_id           patient_id,
        surgee.name                  patient_name,
        surgeon2.physician_id        surgeon_id,
        surgeon.name                 surgeon_name,
        nurse2.registered_nurse_id   nurse_id,
        nurse.name                   nurse_name
    FROM
        or_room_schedule
        INNER JOIN room ON or_room_schedule.room_id = room.room_id
        INNER JOIN visit ON or_room_schedule.visit_id = visit.visit_id
        INNER JOIN patient ON visit.patient_id = patient.patient_id
        INNER JOIN person surgee ON surgee.person_id = patient.person_id
        INNER JOIN physician surgeon2 ON surgeon2.physician_id = or_room_schedule.physician_id
        INNER JOIN employee surgeon1 ON surgeon1.employee_id = surgeon2.employee_id
        INNER JOIN person surgeon ON surgeon1.person_id = surgeon.person_id
        INNER JOIN registered_nurse nurse2 ON nurse2.registered_nurse_id = or_room_schedule.registered_nurse_id
        INNER JOIN employee nurse1 ON nurse1.employee_id = nurse2.employee_id
        INNER JOIN person nurse ON nurse1.person_id = nurse.person_id
    WHERE
        room.room_type = 'Operating Room' and (visit.start_time > TIMESTAMP '2012-12-12 00:00:00' and visit.start_time < TIMESTAMP '2012-12-12 23:59:00' );



--after building the views this will display

SELECT
    patient_name,
    phonenum,
    bill_price,
    appointment_date,
    treatment,
    balance_owed
FROM
    patient_monthly_statement;

SELECT
    room_type,
    start_time,
    end_time,
    treatment
FROM
    operating_room_schedule;

SELECT
    room_type,
    start_time,
    end_time,
    treatment,
    patient_id,
    patient_name,
    surgeon_id,
    surgeon_name,
    nurse_id,
    nurse_name
FROM
    operating_room_log;