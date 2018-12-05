--drop
--Jake
DROP TABLE person CASCADE CONSTRAINTS;

DROP TABLE employee CASCADE CONSTRAINTS;

DROP TABLE nurse_practitioner CASCADE CONSTRAINTS;

DROP TABLE registered_nurse CASCADE CONSTRAINTS;

DROP TABLE pharmacist CASCADE CONSTRAINTS;

DROP TABLE medical_technician CASCADE CONSTRAINTS;

DROP TABLE midwives CASCADE CONSTRAINTS;

DROP TABLE physician CASCADE CONSTRAINTS;

DROP TABLE office_admin CASCADE CONSTRAINTS;

DROP TABLE receptionist CASCADE CONSTRAINTS;

DROP TABLE book_keeper CASCADE CONSTRAINTS;

DROP TABLE bill CASCADE CONSTRAINTS;

DROP TABLE room CASCADE CONSTRAINTS;
--*

DROP TABLE or_room_schedule CASCADE CONSTRAINTS;
--Lauren 

DROP TABLE healthcare CASCADE CONSTRAINTS;
/*
drop table 	privateHealthCare 		 cascade constraints;
drop table 	governmentalHealthCare 	 cascade constraints;
*/

DROP TABLE test CASCADE CONSTRAINTS;

DROP TABLE prescription CASCADE CONSTRAINTS;

DROP TABLE patient CASCADE CONSTRAINTS;

DROP TABLE visit CASCADE CONSTRAINTS;

DROP TABLE sample CASCADE CONSTRAINTS;


--Jake
--create table
--will make ~100

CREATE TABLE person (
    person_id   VARCHAR2(20),
    name        VARCHAR2(30),
    street      VARCHAR2(30),
    city        VARCHAR2(30),
    state       VARCHAR2(30),
    zip         VARCHAR2(30),
    phonenum    VARCHAR2(30),
    CONSTRAINT person_pk PRIMARY KEY ( person_id )
);

--This is also Lauren's but its been moved up here becuase it make sense for it to be here

CREATE TABLE patient (
    patient_id   VARCHAR2(20),
    person_id    VARCHAR2(20),
    CONSTRAINT patient_fk FOREIGN KEY ( person_id )
        REFERENCES person ( person_id ),
    CONSTRAINT patient_pk PRIMARY KEY ( patient_id )
);

CREATE TABLE employee (
    employee_id   VARCHAR2(20),
    person_id     VARCHAR2(20),
    CONSTRAINT employee_fk FOREIGN KEY ( person_id )
        REFERENCES person ( person_id ),
    CONSTRAINT employee_pk PRIMARY KEY ( employee_id )
);

CREATE TABLE nurse_practitioner (
    np_id         VARCHAR2(20),
    employee_id   VARCHAR2(20),
    CONSTRAINT nurse_practitioner_fk FOREIGN KEY ( employee_id )
        REFERENCES employee ( employee_id ),
    CONSTRAINT nurse_practitioner_pk PRIMARY KEY ( np_id )
);

CREATE TABLE registered_nurse (
    registered_nurse_id   VARCHAR2(20),
    employee_id           VARCHAR2(20),
    CONSTRAINT registered_nurse_fk FOREIGN KEY ( employee_id )
        REFERENCES employee ( employee_id ),
    CONSTRAINT registered_nurse_pk PRIMARY KEY ( registered_nurse_id )
);

CREATE TABLE pharmacist (
    pharmacist_id   VARCHAR2(20),
    employee_id     VARCHAR2(20),
    CONSTRAINT pharmacist_fk FOREIGN KEY ( employee_id )
        REFERENCES employee ( employee_id ),
    CONSTRAINT pharmacist_pk PRIMARY KEY ( pharmacist_id )
);

CREATE TABLE medical_technician (
    mt_id         VARCHAR2(20),
    employee_id   VARCHAR2(20),
    CONSTRAINT medical_technician_fk FOREIGN KEY ( employee_id )
        REFERENCES employee ( employee_id ),
    CONSTRAINT medical_technician_pk PRIMARY KEY ( mt_id )
);

CREATE TABLE midwives (
    mw_id         VARCHAR2(20),
    employee_id   VARCHAR2(20),
    CONSTRAINT midwives_fk FOREIGN KEY ( employee_id )
        REFERENCES employee ( employee_id ),
    CONSTRAINT midwives_pk PRIMARY KEY ( mw_id )
);

CREATE TABLE physician (
    physician_id   VARCHAR2(20),
    employee_id    VARCHAR2(20),
    speciality     VARCHAR2(20),
    CONSTRAINT physician_fk FOREIGN KEY ( employee_id )
        REFERENCES employee ( employee_id ),
    CONSTRAINT speciality_check CHECK ( speciality = 'Physician'
                                        OR speciality = 'Surgeon'
                                        OR speciality = 'Pediatrician' ),
    CONSTRAINT physician_pk PRIMARY KEY ( physician_id )
);

CREATE TABLE office_admin (
    oa_id         VARCHAR2(20),
    employee_id   VARCHAR2(20),
    CONSTRAINT office_admin_fk FOREIGN KEY ( employee_id )
        REFERENCES employee ( employee_id ),
    CONSTRAINT office_admin_pk PRIMARY KEY ( oa_id )
);

CREATE TABLE receptionist (
    r_id          VARCHAR2(20),
    employee_id   VARCHAR2(20),
    CONSTRAINT receptionist_fk FOREIGN KEY ( employee_id )
        REFERENCES employee ( employee_id ),
    CONSTRAINT receptionist_pk PRIMARY KEY ( r_id )
);

CREATE TABLE book_keeper (
    book_keeper_id   VARCHAR2(20),
    employee_id      VARCHAR2(20),
    CONSTRAINT book_keeper_fk FOREIGN KEY ( employee_id )
        REFERENCES employee ( employee_id ),
    CONSTRAINT book_keeper PRIMARY KEY ( book_keeper_id )
);

CREATE TABLE bill (
    bill_id          VARCHAR2(20),
    bill_price       NUMBER,
    patient_id       VARCHAR2(20),
    CONSTRAINT bill_fk FOREIGN KEY ( patient_id )
        REFERENCES patient ( patient_id ),
    
    
	--*
    bill_date        DATE,
    --*
    bill_treatment   VARCHAR2(35),
    --*
    amountpaid       NUMBER,
    --*
    CONSTRAINT bill_pk PRIMARY KEY ( bill_id )
);

CREATE TABLE room (
    room_id     VARCHAR2(20),
    room_type   VARCHAR2(25),
    CONSTRAINT room_check CHECK ( room_type = 'Pharmacy'
                                  OR room_type = 'Lab'
                                  OR room_type = 'Birthing Room'
                                  OR room_type = 'Operating Room'
                                  OR room_type = 'Consultation Room'
                                  OR room_type = 'Examination Room'
                                  OR room_type = 'Nurses Station'
                                  OR room_type = 'Administrative Office'
                                  OR room_type = 'Waiting Room'
                                  OR room_type = 'Recovery Room' ),
    CONSTRAINT room_pk PRIMARY KEY ( room_id )
);

--Lauren

CREATE TABLE healthcare (
    health_care_id   VARCHAR2(20),
    type             VARCHAR2(25),
    CONSTRAINT type_check CHECK ( type = 'None'
                                  OR type = 'Governmental'
                                  OR type = 'Private' ),
    patient_id       VARCHAR2(20),
    CONSTRAINT healthcare_fk FOREIGN KEY ( patient_id )
        REFERENCES patient ( patient_id ),
    CONSTRAINT health_care_pk PRIMARY KEY ( health_care_id )
);
/*
create table privateHealthCare(
	PHC_ID  varchar2(20),
	constraint PHC_pk primary key (PHC_ID)
	constraint PHC_fk foreign key (Health_Care_ID)
);

create table governmentalHealthCare(
	GHC_ID primarykey varchar2(20),
	constraint GHC_pk primary key (GHC_ID)
	constraint GHC_fk foreign key (Health_Care_ID)
);
*/

CREATE TABLE test (
    test_id      VARCHAR2(20),
    type         VARCHAR2(75),
    result       VARCHAR2(75),
    patient_id   VARCHAR2(20),
    CONSTRAINT test_fk FOREIGN KEY ( patient_id )
        REFERENCES patient ( patient_id ),
    CONSTRAINT test_pk PRIMARY KEY ( test_id )
);

--Talk about this one

CREATE TABLE prescription (
    prescription_id   VARCHAR2(20),
    medicine_type     VARCHAR2(20),
    amount            INT,
    original_date     DATE,
    filled_date       DATE,
    patient_id        VARCHAR2(20),
    CONSTRAINT prescription_fk FOREIGN KEY ( patient_id )
        REFERENCES patient ( patient_id ),
    CONSTRAINT prescription_pk PRIMARY KEY ( prescription_id )
);

CREATE TABLE visit (
    visit_id     VARCHAR2(20),
    start_time   TimeStamp,
    end_time     TimeStamp,
    --*
    reason       VARCHAR2(50),
    type         VARCHAR2(21),
    patient_id   VARCHAR2(20),
    CONSTRAINT visit_fk FOREIGN KEY ( patient_id )
        REFERENCES patient ( patient_id ),
    CONSTRAINT visit_type_check CHECK ( type = 'walkin'
                                        OR type = 'scheduled appointment' ),
    
	/*
	 we can me these constrants
	walkin, (MAKE TABLE????)
	scheduled appointment (MAKE TABLE????)
	contraint visit_fk foreign key (visit_ID) references patient (patient_ID),
	*/
    CONSTRAINT visit_pk PRIMARY KEY ( visit_id )
);

CREATE TABLE sample (
    sample_id    VARCHAR2(20),
    type         VARCHAR2(20),
    patient_id   VARCHAR2(20),
    CONSTRAINT sample_fk FOREIGN KEY ( patient_id )
        REFERENCES patient ( patient_id ),
    CONSTRAINT sample_pk PRIMARY KEY ( sample_id )
);

--This is also by Jake
--*

CREATE TABLE or_room_schedule (
    or_schedule_id        VARCHAR2(20),
    notes                 VARCHAR2(2000),
    visit_id              VARCHAR2(20),
    CONSTRAINT room_schedule_fk0 FOREIGN KEY ( visit_id )
        REFERENCES visit ( visit_id ),
    room_id               VARCHAR2(20),
    CONSTRAINT room_schedule_fk1 FOREIGN KEY ( room_id )
        REFERENCES room ( room_id ),
    physician_id          VARCHAR2(20),
    CONSTRAINT room_schedule_fk2 FOREIGN KEY ( physician_id )
        REFERENCES physician ( physician_id ),
    registered_nurse_id   VARCHAR2(20),
    CONSTRAINT room_schedule_fk3 FOREIGN KEY ( registered_nurse_id )
        REFERENCES registered_nurse ( registered_nurse_id ),
    CONSTRAINT room_schedule_pk PRIMARY KEY ( or_schedule_id )
);