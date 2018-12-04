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
--Jake

CREATE VIEW patient_monthly_statement AS
    SELECT
        pe.name            patient_name,
        pe.phonenum        phonenum,
        b.bill_price       bill_price,
        b.bill_date        appointment_date,
        b.bill_treatment   treatment,
        (b.bill_price - b.amountpaid) balance_owed
    FROM
        bill b
        INNER JOIN patient p ON p.patient_id = b.patient_id
        INNER JOIN person pe ON pe.person_id = p.person_id
    WHERE
        ( b.bill_price - b.amountpaid ) > 0;

--Jake
Create View Operating_Room_Schedule as
    select
        room.ROOM_TYPE ROOM_TYPE,
        visit.visit_date    treatment_date,
        visit.start_time    start_time,
        visit.end_time      end_time,
        visit.reason        treatment
    from
        room_schedule
        Inner Join room on room_schedule.room_id = room.room_id
        Inner Join visit on room_schedule.visit_id = visit.visit_ID
    where
        room.room_type = 'Operating Room';

--Jake
/*
Operating_Room_Log: 
    This records information about the surgeries actually performed on a given day, including identification of the patient, 
    surgeon, and nurse, and notations and observations about the surgery.
*/
Create View Operating_Room_Log as
    select
        room.ROOM_TYPE              ROOM_TYPE,
        visit.visit_date            treatment_date,
        visit.start_time            start_time,
        visit.end_time              end_time,
        visit.reason                treatment,
        patient.patient_id          patient_id,
        surgee.name                 patient_name,
        surgeon2.physician_id       surgeon_id,
        surgeon.name                surgeon_name,
        nurse2.registered_nurse_id  Nurse_ID,
        nurse.name                  NurseName
    from
        OR_room_schedule
        Inner Join room on OR_room_schedule.room_id = room.room_id
        Inner Join visit on OR_room_schedule.visit_id = visit.visit_ID
        
        Inner Join patient on visit.patient_id = patient.patient_id
        Inner Join person surgee on surgee.person_id = patient.person_id
        
        Inner Join Physician surgeon2 on surgeon2.physician_id = OR_room_schedule.physician_id
        Inner Join Employee surgeon1 on surgeon1.employee_id = surgeon2.employee_id
        Inner Join Person surgeon on surgeon1.person_id = surgeon.person_id
        
        Inner Join Registered_Nurse nurse2 on nurse2.Registered_Nurse_id = OR_room_schedule.Registered_Nurse_id
        Inner Join Employee nurse1 on nurse1.employee_id = surgeon2.nurse_id
        Inner Join Person nurse on nurse1.person_id = nurse.person_id
    where
        room.room_type = 'Operating Room';



--after building the views this will display
SELECT PATIENT_NAME , PHONENUM , BILL_PRICE , APPOINTMENT_DATE , TREATMENT , BALANCE_OWED FROM patient_monthly_statement;
select * from operating_room_schedule;