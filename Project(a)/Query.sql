/*
Patient_Monthly_Statement:
    Any patient who has an unpaid balance receives a statement that is compiled at the end of each month, listing all the 
    services provided that month, any payments received, and the balance due.
Operating Room Schedule: 
    This schedule provides information about all scheduled surgeries for the day.
Operating Room Log: 
    This records information about the surgeries actually performed on a given day, including identification of the patient, 
    surgeon, and nurse, and notations and observations about the surgery.
Daily Delivery Room Log: 
    This records information about all the deliveries performed each day.
Recovery Room Log:
    This report records information about the use of the recovery room, including the patient’s name, attending practitioner, 
    bed, date in, time in, date out, time out, and signature of the practitioner who signs the patient out. A nurse records the 
    times and results of any medical checks performed while the patient is in recovery.
Monthly Activity Report: 
    This is an internal report summarizing the clinic’s activity each month. It shows such items as the number of visits 
    conducted by each provider, the number of surgeries performed, the number of deliveries, the number of lab tests broken down 
    by type, the number of prescriptions dispensed, the average time per visit, and so on.
    
Jake's Thoughts
    We might want to make these full tables with a bunch of foeign keys as far as I am concered 
*/
Drop view Patient_Monthly_Statement;
--Jake
Create View Patient_Monthly_Statement as 
select 
pe.NAME PATIENT_NAME,
pe.PHONENUM PHONENUM,
b.BILL_PRICE BILL_PRICE,
b.PATIENT_ID PATIENT_ID,
b.BILL_DATE APPOINTMENT_DATE,
b.BILL_TREATMENT TREATMENT,
(b.BILL_PRICE - b.AMOUNTPAID) BALANCE_OWED
from bill b
Inner Join patient p on p.patient_ID = b.patient_ID
Inner Join person pe on pe.person_ID = p.person_ID
where (b.BILL_PRICE - b.AMOUNTPAID) > 0;

--Jake



select * from Patient_Monthly_Statement;