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
        ( b.bill_price - b.amountpaid ) balance_owed
    FROM
        bill b
        INNER JOIN patient p ON p.patient_id = b.patient_id
        INNER JOIN person pe ON pe.person_id = p.person_id
    WHERE
        ( b.bill_price - b.amountpaid ) > 0;

--Jake




SELECT
    *
FROM
    patient_monthly_statement;