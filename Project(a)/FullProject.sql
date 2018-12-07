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

INSERT INTO person VALUES (
    '155',
    'Allan  Antos',
    '777 13th Street',
    'Center Valley',
    'PA',
    '69875',
    '377-943-5928'
);

INSERT INTO person VALUES (
    '212',
    'Domingo  Stossel',
    '241 Church Street South',
    'Center Valley',
    'PA',
    '69875',
    '345-348-9553'
);

INSERT INTO person VALUES (
    '685',
    'Torrie  Lemessurier',
    '719 Church Street North',
    'Center Valley',
    'PA',
    '69875',
    '724-923-8864'
);

INSERT INTO person VALUES (
    '246',
    'Charlyn  Maccormick',
    '292 Primrose Lane',
    'Center Valley',
    'PA',
    '69875',
    '829-627-6746'
);

INSERT INTO person VALUES (
    '467',
    'Janeth  Dooley',
    '159 River Street',
    'Center Valley',
    'PA',
    '69875',
    '622-169-7779'
);

INSERT INTO person VALUES (
    '369',
    'Cathi  Maccormick',
    '216 Crescent Street',
    'Center Valley',
    'PA',
    '69875',
    '271-422-9958'
);

INSERT INTO person VALUES (
    '173',
    'Roseline  Vladinov',
    '465 Market Street',
    'Center Valley',
    'PA',
    '69875',
    '543-889-5853'
);

INSERT INTO person VALUES (
    '973',
    'Roxanna  Perko',
    '849 B Street',
    'Center Valley',
    'PA',
    '69875',
    '942-477-2393'
);

INSERT INTO person VALUES (
    '357',
    'Adena  Tilney',
    '488 Lantern Lane',
    'Center Valley',
    'PA',
    '69875',
    '432-525-5725'
);

INSERT INTO person VALUES (
    '138',
    'Sade  Steen',
    '333 Main Street East',
    'Center Valley',
    'PA',
    '69875',
    '164-396-2235'
);

INSERT INTO person VALUES (
    '263',
    'Lilly  Chadbourne',
    '152 Euclid Avenue',
    'Center Valley',
    'PA',
    '69875',
    '389-596-9437'
);

INSERT INTO person VALUES (
    '238',
    'Tandra  Norberg',
    '969 Mechanic Street',
    'Center Valley',
    'PA',
    '69875',
    '456-893-6116'
);

INSERT INTO person VALUES (
    '579',
    'Kaitlin  Zerbini',
    '893 Church Road',
    'Center Valley',
    'PA',
    '69875',
    '998-439-2355'
);

INSERT INTO person VALUES (
    '355',
    'Germaine  Welther',
    '543 Penn Street',
    'Center Valley',
    'PA',
    '69875',
    '777-924-8745'
);

INSERT INTO person VALUES (
    '389',
    'Royce  Ohara',
    '123 Elizabeth Street',
    'Center Valley',
    'PA',
    '69875',
    '219-381-7158'
);

INSERT INTO person VALUES (
    '841',
    'Werner  Castillo',
    '482 Walnut Avenue',
    'Center Valley',
    'PA',
    '69875',
    '851-542-1396'
);

INSERT INTO person VALUES (
    '498',
    'Riva  Hattersley',
    '137 Prospect Avenue',
    'Center Valley',
    'PA',
    '69875',
    '485-137-4188'
);

INSERT INTO person VALUES (
    '227',
    'Florene  Finau',
    '719 Creekside Drive',
    'Center Valley',
    'PA',
    '69875',
    '725-197-7181'
);

INSERT INTO person VALUES (
    '183',
    'Juan  Klint',
    '463 Poplar Street',
    'Center Valley',
    'PA',
    '69875',
    '278-755-6546'
);

INSERT INTO person VALUES (
    '255',
    'Dustin  Ousley',
    '794 Beechwood Drive',
    'Center Valley',
    'PA',
    '69875',
    '385-982-4663'
);

INSERT INTO person VALUES (
    '593',
    'Lorinda  Hassard',
    '323 Franklin Avenue',
    'Center Valley',
    'PA',
    '69875',
    '338-743-3517'
);

INSERT INTO person VALUES (
    '944',
    'Natasha  Mcvay',
    '174 2nd Avenue',
    'Center Valley',
    'PA',
    '69875',
    '241-794-2288'
);

INSERT INTO person VALUES (
    '469',
    'Clifford  Schatz',
    '527 Oak Avenue',
    'Center Valley',
    'PA',
    '69875',
    '652-353-8476'
);

INSERT INTO person VALUES (
    '377',
    'Bonita  Gerig',
    '587 Roosevelt Avenue',
    'Center Valley',
    'PA',
    '69875',
    '554-296-7284'
);

INSERT INTO person VALUES (
    '273',
    'Zula  Lemessurier',
    '695 Brook Lane',
    'Center Valley',
    'PA',
    '69875',
    '438-512-5682'
);

INSERT INTO person VALUES (
    '684',
    'Jed  Santamaria',
    '999 Summit Street',
    'Center Valley',
    'PA',
    '69875',
    '989-626-1827'
);

INSERT INTO person VALUES (
    '677',
    'Janean  Correia',
    '438 Fulton Street',
    'Center Valley',
    'PA',
    '69875',
    '149-391-1155'
);

INSERT INTO person VALUES (
    '781',
    'Brittani  Rodrigues',
    '781 Creekside Drive',
    'Center Valley',
    'PA',
    '69875',
    '524-119-5932'
);

INSERT INTO person VALUES (
    '936',
    'Devon  Bartholet',
    '753 Summer Street',
    'Center Valley',
    'PA',
    '69875',
    '686-518-1889'
);

INSERT INTO person VALUES (
    '826',
    'Lean  Waterfield',
    '692 Dogwood Drive',
    'Center Valley',
    'PA',
    '69875',
    '279-368-6317'
);

INSERT INTO person VALUES (
    '427',
    'Virgilio  Waterfield',
    '734 Ridge Avenue',
    'Center Valley',
    'PA',
    '69875',
    '381-377-3632'
);

INSERT INTO person VALUES (
    '551',
    'Jovan  Gozzi',
    '877 Cemetery Road',
    'Center Valley',
    'PA',
    '69875',
    '935-642-5755'
);

INSERT INTO person VALUES (
    '881',
    'Germaine  Riccardi',
    '216 Park Avenue',
    'Center Valley',
    'PA',
    '69875',
    '558-538-5642'
);

INSERT INTO person VALUES (
    '312',
    'Leonard  Piessens',
    '698 East Street',
    'Center Valley',
    'PA',
    '69875',
    '948-639-9737'
);

INSERT INTO person VALUES (
    '417',
    'Dorene  Welsh-carroll',
    '524 Fawn Lane',
    'Center Valley',
    'PA',
    '69875',
    '772-283-4284'
);

INSERT INTO person VALUES (
    '331',
    'Lavenia  Hassard',
    '529 B Street',
    'Center Valley',
    'PA',
    '69875',
    '588-382-9459'
);

INSERT INTO person VALUES (
    '656',
    'Lakeisha  Boss',
    '433 Deerfield Drive',
    'Center Valley',
    'PA',
    '69875',
    '437-174-9664'
);

INSERT INTO person VALUES (
    '913',
    'Denese  Fryar',
    '927 B Street',
    'Center Valley',
    'PA',
    '69875',
    '815-698-4859'
);

INSERT INTO person VALUES (
    '419',
    'Camellia  Schinaia',
    '315 King Street',
    'Center Valley',
    'PA',
    '69875',
    '886-635-9275'
);

INSERT INTO person VALUES (
    '554',
    'Jolyn  Hoss',
    '278 East Avenue',
    'Center Valley',
    'PA',
    '69875',
    '799-613-1265'
);

INSERT INTO person VALUES (
    '117',
    'Nenita  Hallisey',
    '234 Cleveland Avenue',
    'Center Valley',
    'PA',
    '69875',
    '697-948-3397'
);

INSERT INTO person VALUES (
    '951',
    'Camellia  Kissinger',
    '515 Court Street',
    'Center Valley',
    'PA',
    '69875',
    '439-621-9281'
);

INSERT INTO person VALUES (
    '564',
    'Edra  Lawless',
    '754 School Street',
    'Center Valley',
    'PA',
    '69875',
    '959-653-3644'
);

INSERT INTO person VALUES (
    '444',
    'Andria  Sams',
    '423 North Avenue',
    'Center Valley',
    'PA',
    '69875',
    '223-594-8314'
);

INSERT INTO person VALUES (
    '171',
    'Joaquin  Nixon',
    '595 Durham Court',
    'Center Valley',
    'PA',
    '69875',
    '383-628-1977'
);

INSERT INTO person VALUES (
    '288',
    'Jeanine  Blodgett',
    '824 Railroad Street',
    'Center Valley',
    'PA',
    '69875',
    '221-761-1381'
);

INSERT INTO person VALUES (
    '846',
    'Gertrude  Etheridge',
    '613 Maple Lane',
    'Center Valley',
    'PA',
    '69875',
    '544-925-3429'
);

INSERT INTO person VALUES (
    '946',
    'Hal  Mendelman',
    '287 Bridle Lane',
    'Center Valley',
    'PA',
    '69875',
    '138-634-1489'
);

INSERT INTO person VALUES (
    '626',
    'Carlyn  Sams',
    '399 Clinton Street',
    'Center Valley',
    'PA',
    '69875',
    '717-394-4637'
);

INSERT INTO person VALUES (
    '219',
    'Tressie  Hollander',
    '765 Cottage Street',
    'Center Valley',
    'PA',
    '69875',
    '253-144-8464'
);

INSERT INTO person VALUES (
    '322',
    'Bryon  Keener',
    '931 William Street',
    'Center Valley',
    'PA',
    '69875',
    '825-668-3741'
);

INSERT INTO person VALUES (
    '123',
    'Dora  Padgett',
    '236 Olive Street',
    'Center Valley',
    'PA',
    '69875',
    '516-827-4574'
);

INSERT INTO person VALUES (
    '711',
    'Yoshiko  Stillman',
    '433 Howard Street',
    'Center Valley',
    'PA',
    '69875',
    '285-938-2377'
);

INSERT INTO person VALUES (
    '859',
    'Joaquin  Sali',
    '542 Park Street',
    'Center Valley',
    'PA',
    '69875',
    '329-384-3942'
);

INSERT INTO person VALUES (
    '359',
    'Joyce  Riccardi',
    '499 Elizabeth Street',
    'Center Valley',
    'PA',
    '69875',
    '851-543-2433'
);

INSERT INTO person VALUES (
    '143',
    'Matilde  Leopold',
    '363 Spruce Street',
    'Center Valley',
    'PA',
    '69875',
    '878-494-2719'
);

INSERT INTO person VALUES (
    '616',
    'Tillie  Reid-jones',
    '857 Court Street',
    'Center Valley',
    'PA',
    '69875',
    '919-546-8451'
);

INSERT INTO person VALUES (
    '666',
    'Rachele  Rasanen',
    '484 Prospect Avenue',
    'Center Valley',
    'PA',
    '69875',
    '936-182-7865'
);

INSERT INTO person VALUES (
    '668',
    'Debera  Odonnell',
    '913 Howard Street',
    'Center Valley',
    'PA',
    '69875',
    '356-884-9313'
);

INSERT INTO person VALUES (
    '162',
    'Rick  Zampino',
    '529 Evergreen Drive',
    'Center Valley',
    'PA',
    '69875',
    '476-872-3575'
);

INSERT INTO person VALUES (
    '896',
    'Gale  Mongan',
    '921 Park Drive',
    'Center Valley',
    'PA',
    '69875',
    '819-254-7945'
);

INSERT INTO person VALUES (
    '254',
    'Cecelia  Alvarez',
    '182 Bridge Street',
    'Center Valley',
    'PA',
    '69875',
    '428-431-3539'
);

INSERT INTO person VALUES (
    '342',
    'Selina  Huttenback',
    '844 B Street',
    'Center Valley',
    'PA',
    '69875',
    '437-117-4234'
);

INSERT INTO person VALUES (
    '346',
    'Charlette  Castillo',
    '472 3rd Avenue',
    'Center Valley',
    'PA',
    '69875',
    '381-122-5486'
);

INSERT INTO person VALUES (
    '727',
    'Rashad  Piessens',
    '153 Hillcrest Drive',
    'Center Valley',
    'PA',
    '69875',
    '724-696-6838'
);

INSERT INTO person VALUES (
    '721',
    'Detra  Anker',
    '919 Lantern Lane',
    'Center Valley',
    'PA',
    '69875',
    '975-646-1832'
);

INSERT INTO person VALUES (
    '243',
    'Jeanice  Anker',
    '641 Belmont Avenue',
    'Center Valley',
    'PA',
    '69875',
    '386-198-3682'
);

INSERT INTO person VALUES (
    '755',
    'Trista  Zmijewski',
    '777 Elm Street',
    'Center Valley',
    'PA',
    '69875',
    '499-242-3982'
);

INSERT INTO person VALUES (
    '985',
    'Carlyn  Tollestrup',
    '328 Tanglewood Drive',
    'Center Valley',
    'PA',
    '69875',
    '417-734-1396'
);

INSERT INTO person VALUES (
    '142',
    'Tillie  Queen',
    '269 Willow Street',
    'Center Valley',
    'PA',
    '69875',
    '269-367-2286'
);

INSERT INTO person VALUES (
    '334',
    'Jeri  Arbia',
    '971 Smith Street',
    'Center Valley',
    'PA',
    '69875',
    '828-496-4178'
);

INSERT INTO person VALUES (
    '127',
    'Amiee  Van saun',
    '892 James Street',
    'Center Valley',
    'PA',
    '69875',
    '867-396-9493'
);

INSERT INTO person VALUES (
    '441',
    'Corrie  Correia',
    '224 Pheasant Run',
    'Center Valley',
    'PA',
    '69875',
    '568-975-7248'
);

INSERT INTO person VALUES (
    '436',
    'Corrie  Newsweek',
    '146 Magnolia Drive',
    'Center Valley',
    'PA',
    '69875',
    '583-982-6924'
);

INSERT INTO person VALUES (
    '125',
    'Cathi  Trifiro',
    '491 Tanglewood Drive',
    'Center Valley',
    'PA',
    '69875',
    '545-221-4192'
);

INSERT INTO person VALUES (
    '277',
    'Tillie  Prosperi',
    '778 Lilac Lane',
    'Center Valley',
    'PA',
    '69875',
    '927-671-2585'
);

INSERT INTO person VALUES (
    '461',
    'Gema  Deng',
    '885 Route 5',
    'Center Valley',
    'PA',
    '69875',
    '635-391-7489'
);

INSERT INTO person VALUES (
    '891',
    'Shana  Pincus',
    '266 Cottage Street',
    'Center Valley',
    'PA',
    '69875',
    '287-378-1626'
);

INSERT INTO person VALUES (
    '297',
    'Edra  Knipe',
    '996 Front Street',
    'Center Valley',
    'PA',
    '69875',
    '596-369-3728'
);

INSERT INTO person VALUES (
    '256',
    'Joaquin  Mongan',
    '758 Main Street West',
    'Center Valley',
    'PA',
    '69875',
    '355-115-5214'
);

INSERT INTO person VALUES (
    '598',
    'Gayla  Ceniceros',
    '649 East Street',
    'Center Valley',
    'PA',
    '69875',
    '611-645-1758'
);

INSERT INTO person VALUES (
    '455',
    'Kenyatta  Handcock',
    '363 Willow Lane',
    'Center Valley',
    'PA',
    '69875',
    '528-185-9586'
);

INSERT INTO person VALUES (
    '724',
    'Domonique  Strobach',
    '982 Route 10',
    'Center Valley',
    'PA',
    '69875',
    '285-511-6422'
);

INSERT INTO person VALUES (
    '324',
    'Lorinda  Acambages',
    '672 Bank Street',
    'Center Valley',
    'PA',
    '69875',
    '237-922-3846'
);

INSERT INTO person VALUES (
    '728',
    'Lien  Pitfield',
    '648 13th Street',
    'Center Valley',
    'PA',
    '69875',
    '739-154-7867'
);

INSERT INTO person VALUES (
    '767',
    'Elizabet  Goldhaber',
    '292 Berkshire Drive',
    'Center Valley',
    'PA',
    '69875',
    '227-488-8463'
);

INSERT INTO person VALUES (
    '929',
    'Alva  Odonnell',
    '324 Mulberry Street',
    'Center Valley',
    'PA',
    '69875',
    '185-936-1531'
);

INSERT INTO person VALUES (
    '886',
    'Detra  Mongan',
    '469 Manor Drive',
    'Center Valley',
    'PA',
    '69875',
    '675-959-2741'
);

INSERT INTO person VALUES (
    '947',
    'Maryam  Weiger',
    '141 Pleasant Street',
    'Center Valley',
    'PA',
    '69875',
    '159-121-4266'
);

INSERT INTO person VALUES (
    '723',
    'Terrence  Hilton',
    '674 Route 5',
    'Center Valley',
    'PA',
    '69875',
    '899-524-4933'
);

INSERT INTO person VALUES (
    '534',
    'Shela  Zampino',
    '312 Elm Street',
    'Center Valley',
    'PA',
    '69875',
    '655-575-7435'
);

INSERT INTO person VALUES (
    '423',
    'Edra  Carrier',
    '222 Street Road',
    'Center Valley',
    'PA',
    '69875',
    '798-834-3174'
);

INSERT INTO person VALUES (
    '777',
    'Hector  Flynn-johnson',
    '721 Winding Way',
    'Center Valley',
    'PA',
    '69875',
    '785-473-2265'
);

INSERT INTO person VALUES (
    '912',
    'Coreen  Schatz',
    '778 Chestnut Avenue',
    'Center Valley',
    'PA',
    '69875',
    '819-315-4968'
);

INSERT INTO person VALUES (
    '989',
    'Jeanine  Pope',
    '738 East Avenue',
    'Center Valley',
    'PA',
    '69875',
    '577-461-7683'
);

INSERT INTO person VALUES (
    '839',
    'Denese  Andrews',
    '456 Dogwood Drive',
    'Center Valley',
    'PA',
    '69875',
    '772-688-2747'
);

INSERT INTO person VALUES (
    '253',
    'Marty  Strobach',
    '967 Belmont Avenue',
    'Center Valley',
    'PA',
    '69875',
    '158-847-7898'
);

INSERT INTO person VALUES (
    '114',
    'Serafina  Choo',
    '598 Aspen Court',
    'Center Valley',
    'PA',
    '69875',
    '123-963-9743'
);

INSERT INTO person VALUES (
    '178',
    'Simone  Hallisey',
    '259 Union Street',
    'Center Valley',
    'PA',
    '69875',
    '386-563-1875'
);

INSERT INTO person VALUES (
    '375',
    'Fletcher  Huttenback',
    '241 Taylor Street',
    'Center Valley',
    'PA',
    '69875',
    '171-247-9562'
);

INSERT INTO person VALUES (
    '179',
    'Kyong  Samoggia',
    '953 Front Street',
    'Center Valley',
    'PA',
    '69875',
    '364-896-2843'
);

INSERT INTO person VALUES (
    '211',
    'Juan  Engel',
    '281 Franklin Court',
    'Center Valley',
    'PA',
    '69875',
    '567-556-5434'
);

INSERT INTO person VALUES (
    '818',
    'Denese  Archer',
    '923 Franklin Street',
    'Center Valley',
    'PA',
    '69875',
    '985-371-5884'
);

INSERT INTO person VALUES (
    '181',
    'In  Sams',
    '616 Cedar Street',
    'Center Valley',
    'PA',
    '69875',
    '427-939-3395'
);

INSERT INTO person VALUES (
    '916',
    'Domonique  Klotz',
    '245 Division Street',
    'Center Valley',
    'PA',
    '69875',
    '568-938-8754'
);

INSERT INTO person VALUES (
    '241',
    'Inell  Mcnitt',
    '745 Route 64',
    'Center Valley',
    'PA',
    '69875',
    '247-255-1961'
);

INSERT INTO person VALUES (
    '521',
    'Hal  Nickoloff',
    '489 2nd Street East',
    'Center Valley',
    'PA',
    '69875',
    '954-511-8151'
);

INSERT INTO person VALUES (
    '743',
    'Tanja  Jagger',
    '792 Linden Street',
    'Center Valley',
    'PA',
    '69875',
    '545-626-9317'
);

INSERT INTO person VALUES (
    '251',
    'Cecelia  Waterfield',
    '617 River Road',
    'Center Valley',
    'PA',
    '69875',
    '746-367-2687'
);

INSERT INTO person VALUES (
    '573',
    'Zoila  Fumerton',
    '777 5th Avenue',
    'Center Valley',
    'PA',
    '69875',
    '657-358-9131'
);

INSERT INTO person VALUES (
    '879',
    'Germaine  Morgan',
    '945 Broad Street',
    'Center Valley',
    'PA',
    '69875',
    '478-798-5111'
);

INSERT INTO person VALUES (
    '281',
    'SheltonDempsey',
    '723 Lantern Lane',
    'Center Valley',
    'PA',
    '69875',
    '132-553-4471'
);

INSERT INTO person VALUES (
    '884',
    'Pauline  Mingle',
    '896 Columbia Street',
    'Center Valley',
    'PA',
    '69875',
    '831-992-4671'
);

INSERT INTO person VALUES (
    '319',
    'Carly  Rebelo-gomes',
    '164 Route 32',
    'Center Valley',
    'PA',
    '69875',
    '417-448-8194'
);

INSERT INTO person VALUES (
    '394',
    'Rhiannon  Tollestrup',
    '171 Spruce Avenue',
    'Center Valley',
    'PA',
    '69875',
    '171-153-1897'
);

INSERT INTO person VALUES (
    '236',
    'Marcellus  Paul',
    '217 Orange Street',
    'Center Valley',
    'PA',
    '69875',
    '166-724-4411'
);

INSERT INTO person VALUES (
    '799',
    'Trudi  Davidovitch',
    '349 Woodland Avenue',
    'Center Valley',
    'PA',
    '69875',
    '562-846-1945'
);

INSERT INTO person VALUES (
    '675',
    'Juan  Wiatrowsky',
    '231 John Street',
    'Center Valley',
    'PA',
    '69875',
    '372-531-1196'
);

INSERT INTO person VALUES (
    '294',
    'Nenita  Giles',
    '732 Orange Street',
    'Center Valley',
    'PA',
    '69875',
    '417-135-8331'
);

INSERT INTO person VALUES (
    '866',
    'Agnus  Unamuno',
    '839 Clark Street',
    'Center Valley',
    'PA',
    '69875',
    '156-982-3494'
);

INSERT INTO person VALUES (
    '712',
    'Reinaldo  Piessens',
    '342 Summit Street',
    'Center Valley',
    'PA',
    '69875',
    '889-533-9918'
);

INSERT INTO person VALUES (
    '733',
    'Dustin  Brinkmann',
    '447 9th Street West',
    'Center Valley',
    'PA',
    '69875',
    '819-416-6477'
);

INSERT INTO person VALUES (
    '958',
    'Andre  Conrad',
    '254 Penn Street',
    'Center Valley',
    'PA',
    '69875',
    '345-159-4445'
);

INSERT INTO person VALUES (
    '175',
    'Lean  Delacey',
    '635 Lincoln Street',
    'Center Valley',
    'PA',
    '69875',
    '852-748-1931'
);

INSERT INTO person VALUES (
    '491',
    'Simone  Yong',
    '572 Franklin Court',
    'Center Valley',
    'PA',
    '69875',
    '881-142-5121'
);

INSERT INTO person VALUES (
    '581',
    'Anabel  Simon',
    '424 Locust Street',
    'Center Valley',
    'PA',
    '69875',
    '558-195-3752'
);

INSERT INTO employee VALUES (
    '915',
    '155'
);

INSERT INTO employee VALUES (
    '194',
    '212'
);

INSERT INTO employee VALUES (
    '568',
    '685'
);

INSERT INTO employee VALUES (
    '934',
    '246'
);

INSERT INTO employee VALUES (
    '611',
    '467'
);

INSERT INTO employee VALUES (
    '134',
    '369'
);

INSERT INTO employee VALUES (
    '247',
    '173'
);

INSERT INTO employee VALUES (
    '487',
    '973'
);

INSERT INTO employee VALUES (
    '748',
    '357'
);

INSERT INTO employee VALUES (
    '777',
    '138'
);

INSERT INTO employee VALUES (
    '362',
    '263'
);

INSERT INTO employee VALUES (
    '726',
    '238'
);

INSERT INTO employee VALUES (
    '369',
    '579'
);

INSERT INTO employee VALUES (
    '111',
    '355'
);

INSERT INTO employee VALUES (
    '948',
    '389'
);

INSERT INTO employee VALUES (
    '262',
    '841'
);

INSERT INTO patient VALUES (
    '426',
    '498'
);

INSERT INTO patient VALUES (
    '394',
    '227'
);

INSERT INTO patient VALUES (
    '814',
    '183'
);

INSERT INTO patient VALUES (
    '797',
    '255'
);

INSERT INTO patient VALUES (
    '733',
    '593'
);

INSERT INTO patient VALUES (
    '693',
    '944'
);

INSERT INTO patient VALUES (
    '196',
    '469'
);

INSERT INTO patient VALUES (
    '642',
    '377'
);

INSERT INTO patient VALUES (
    '152',
    '273'
);

INSERT INTO patient VALUES (
    '327',
    '684'
);

INSERT INTO patient VALUES (
    '546',
    '973'
);

INSERT INTO patient VALUES (
    '685',
    '677'
);

INSERT INTO patient VALUES (
    '697',
    '781'
);

INSERT INTO patient VALUES (
    '921',
    '936'
);

INSERT INTO patient VALUES (
    '688',
    '826'
);

INSERT INTO patient VALUES (
    '371',
    '427'
);

INSERT INTO patient VALUES (
    '134',
    '138'
);

INSERT INTO patient VALUES (
    '737',
    '685'
);

INSERT INTO patient VALUES (
    '274',
    '551'
);

INSERT INTO patient VALUES (
    '585',
    '881'
);

INSERT INTO patient VALUES (
    '873',
    '312'
);

INSERT INTO patient VALUES (
    '695',
    '417'
);

INSERT INTO patient VALUES (
    '314',
    '781'
);

INSERT INTO patient VALUES (
    '444',
    '331'
);

INSERT INTO patient VALUES (
    '849',
    '656'
);

INSERT INTO patient VALUES (
    '836',
    '913'
);

INSERT INTO patient VALUES (
    '576',
    '419'
);

INSERT INTO patient VALUES (
    '328',
    '417'
);

INSERT INTO patient VALUES (
    '947',
    '554'
);

INSERT INTO patient VALUES (
    '945',
    '117'
);

INSERT INTO patient VALUES (
    '889',
    '227'
);

INSERT INTO patient VALUES (
    '626',
    '951'
);

INSERT INTO patient VALUES (
    '587',
    '564'
);

INSERT INTO patient VALUES (
    '963',
    '444'
);

INSERT INTO patient VALUES (
    '899',
    '171'
);

INSERT INTO patient VALUES (
    '141',
    '288'
);

INSERT INTO patient VALUES (
    '761',
    '846'
);

INSERT INTO patient VALUES (
    '987',
    '946'
);

INSERT INTO patient VALUES (
    '477',
    '219'
);

INSERT INTO patient VALUES (
    '313',
    '322'
);

INSERT INTO patient VALUES (
    '497',
    '123'
);

INSERT INTO patient VALUES (
    '397',
    '711'
);

INSERT INTO patient VALUES (
    '768',
    '859'
);

INSERT INTO patient VALUES (
    '934',
    '359'
);

INSERT INTO patient VALUES (
    '686',
    '143'
);

INSERT INTO patient VALUES (
    '528',
    '616'
);

INSERT INTO patient VALUES (
    '483',
    '666'
);

INSERT INTO patient VALUES (
    '656',
    '668'
);

INSERT INTO patient VALUES (
    '168',
    '162'
);

INSERT INTO patient VALUES (
    '951',
    '896'
);

INSERT INTO patient VALUES (
    '841',
    '254'
);

INSERT INTO patient VALUES (
    '163',
    '342'
);

INSERT INTO patient VALUES (
    '612',
    '346'
);

INSERT INTO patient VALUES (
    '573',
    '727'
);

INSERT INTO patient VALUES (
    '315',
    '721'
);

INSERT INTO patient VALUES (
    '743',
    '243'
);

INSERT INTO patient VALUES (
    '942',
    '755'
);

INSERT INTO patient VALUES (
    '621',
    '985'
);

INSERT INTO patient VALUES (
    '459',
    '142'
);

INSERT INTO patient VALUES (
    '257',
    '334'
);

INSERT INTO patient VALUES (
    '863',
    '127'
);

INSERT INTO patient VALUES (
    '162',
    '436'
);

INSERT INTO patient VALUES (
    '853',
    '125'
);

INSERT INTO patient VALUES (
    '476',
    '162'
);

INSERT INTO patient VALUES (
    '339',
    '461'
);

INSERT INTO patient VALUES (
    '129',
    '322'
);

INSERT INTO patient VALUES (
    '983',
    '142'
);

INSERT INTO patient VALUES (
    '824',
    '891'
);

INSERT INTO patient VALUES (
    '142',
    '297'
);

INSERT INTO patient VALUES (
    '678',
    '256'
);

INSERT INTO patient VALUES (
    '731',
    '598'
);

INSERT INTO patient VALUES (
    '891',
    '455'
);

INSERT INTO patient VALUES (
    '643',
    '334'
);

INSERT INTO patient VALUES (
    '896',
    '324'
);

INSERT INTO patient VALUES (
    '888',
    '728'
);

INSERT INTO patient VALUES (
    '646',
    '767'
);

INSERT INTO patient VALUES (
    '993',
    '929'
);

INSERT INTO patient VALUES (
    '412',
    '886'
);

INSERT INTO patient VALUES (
    '926',
    '947'
);

INSERT INTO patient VALUES (
    '726',
    '423'
);

INSERT INTO patient VALUES (
    '467',
    '846'
);

INSERT INTO patient VALUES (
    '941',
    '777'
);

INSERT INTO patient VALUES (
    '361',
    '355'
);

INSERT INTO patient VALUES (
    '512',
    '162'
);

INSERT INTO patient VALUES (
    '331',
    '912'
);

INSERT INTO patient VALUES (
    '326',
    '989'
);

INSERT INTO patient VALUES (
    '244',
    '312'
);

INSERT INTO patient VALUES (
    '636',
    '839'
);

INSERT INTO patient VALUES (
    '639',
    '253'
);

INSERT INTO patient VALUES (
    '254',
    '114'
);

INSERT INTO patient VALUES (
    '253',
    '936'
);

INSERT INTO patient VALUES (
    '449',
    '178'
);

INSERT INTO patient VALUES (
    '756',
    '375'
);

INSERT INTO patient VALUES (
    '243',
    '179'
);

INSERT INTO patient VALUES (
    '698',
    '211'
);

INSERT INTO patient VALUES (
    '717',
    '818'
);

INSERT INTO patient VALUES (
    '548',
    '916'
);

INSERT INTO patient VALUES (
    '624',
    '912'
);

INSERT INTO patient VALUES (
    '755',
    '277'
);

INSERT INTO patient VALUES (
    '236',
    '241'
);

INSERT INTO patient VALUES (
    '651',
    '521'
);

INSERT INTO patient VALUES (
    '671',
    '219'
);

INSERT INTO patient VALUES (
    '794',
    '743'
);

INSERT INTO patient VALUES (
    '191',
    '455'
);

INSERT INTO patient VALUES (
    '316',
    '251'
);

INSERT INTO patient VALUES (
    '788',
    '573'
);

INSERT INTO patient VALUES (
    '729',
    '879'
);

INSERT INTO patient VALUES (
    '381',
    '162'
);

INSERT INTO patient VALUES (
    '871',
    '281'
);

INSERT INTO patient VALUES (
    '133',
    '319'
);

INSERT INTO patient VALUES (
    '663',
    '799'
);

INSERT INTO patient VALUES (
    '599',
    '675'
);

INSERT INTO patient VALUES (
    '335',
    '281'
);

INSERT INTO patient VALUES (
    '353',
    '294'
);

INSERT INTO patient VALUES (
    '692',
    '866'
);

INSERT INTO patient VALUES (
    '647',
    '712'
);

INSERT INTO patient VALUES (
    '955',
    '491'
);

INSERT INTO patient VALUES (
    '356',
    '581'
);

INSERT INTO nurse_practitioner VALUES (
    '874',
    '915'
);

INSERT INTO nurse_practitioner VALUES (
    '156',
    '194'
);

INSERT INTO registered_nurse VALUES (
    '449',
    '568'
);

INSERT INTO registered_nurse VALUES (
    '742',
    '934'
);

INSERT INTO pharmacist VALUES (
    '126',
    '611'
);

INSERT INTO pharmacist VALUES (
    '767',
    '134'
);

INSERT INTO midwives VALUES (
    '169',
    '247'
);

INSERT INTO midwives VALUES (
    '934',
    '487'
);

INSERT INTO physician VALUES (
    '742',
    '748',
    'Physician'
);

INSERT INTO physician VALUES (
    '242',
    '777',
    'Surgeon'
);

INSERT INTO physician VALUES (
    '171',
    '362',
    'Pediatrician'
);

INSERT INTO physician VALUES (
    '135',
    '726',
    'Physician'
);

INSERT INTO physician VALUES (
    '685',
    '369',
    'Physician'
);

INSERT INTO office_admin VALUES (
    '854',
    '111'
);

INSERT INTO receptionist VALUES (
    '498',
    '948'
);

INSERT INTO book_keeper VALUES (
    '195',
    '262'
);

INSERT INTO healthcare VALUES (
    '1',
    NULL,
    '426'
);

INSERT INTO healthcare VALUES (
    '2',
    'Governmental',
    '394'
);

INSERT INTO healthcare VALUES (
    '3',
    'Private',
    '814'
);

INSERT INTO healthcare VALUES (
    '4',
    'None',
    '797'
);

INSERT INTO healthcare VALUES (
    '5',
    'None',
    '733'
);

INSERT INTO healthcare VALUES (
    '6',
    'None',
    '693'
);

INSERT INTO healthcare VALUES (
    '7',
    'None',
    '196'
);

INSERT INTO healthcare VALUES (
    '8',
    'None',
    '642'
);

INSERT INTO healthcare VALUES (
    '9',
    'None',
    '152'
);

INSERT INTO healthcare VALUES (
    '10',
    'None',
    '327'
);

INSERT INTO healthcare VALUES (
    '11',
    'None',
    '546'
);

INSERT INTO healthcare VALUES (
    '12',
    'None',
    '685'
);

INSERT INTO healthcare VALUES (
    '13',
    'None',
    '697'
);

INSERT INTO healthcare VALUES (
    '14',
    'None',
    '921'
);

INSERT INTO healthcare VALUES (
    '15',
    'None',
    '688'
);

INSERT INTO healthcare VALUES (
    '16',
    'None',
    '371'
);

INSERT INTO healthcare VALUES (
    '17',
    'None',
    '134'
);

INSERT INTO healthcare VALUES (
    '18',
    'None',
    '737'
);

INSERT INTO healthcare VALUES (
    '19',
    'None',
    '274'
);

INSERT INTO healthcare VALUES (
    '20',
    'None',
    '585'
);

INSERT INTO healthcare VALUES (
    '21',
    'None',
    '873'
);

INSERT INTO healthcare VALUES (
    '22',
    'Private',
    '695'
);

INSERT INTO healthcare VALUES (
    '23',
    'None',
    '314'
);

INSERT INTO healthcare VALUES (
    '24',
    'Governmental',
    '444'
);

INSERT INTO healthcare VALUES (
    '25',
    'None',
    '849'
);

INSERT INTO healthcare VALUES (
    '26',
    'Governmental',
    '836'
);

INSERT INTO healthcare VALUES (
    '27',
    'Governmental',
    '576'
);

INSERT INTO healthcare VALUES (
    '28',
    'Private',
    '328'
);

INSERT INTO healthcare VALUES (
    '29',
    'Private',
    '947'
);

INSERT INTO healthcare VALUES (
    '30',
    'Private',
    '945'
);

INSERT INTO healthcare VALUES (
    '31',
    'Private',
    '889'
);

INSERT INTO healthcare VALUES (
    '32',
    'Private',
    '626'
);

INSERT INTO healthcare VALUES (
    '33',
    'Private',
    '587'
);

INSERT INTO healthcare VALUES (
    '34',
    'Private',
    '963'
);

INSERT INTO healthcare VALUES (
    '35',
    'Private',
    '899'
);

INSERT INTO healthcare VALUES (
    '36',
    'None',
    '141'
);

INSERT INTO healthcare VALUES (
    '37',
    'Private',
    '761'
);

INSERT INTO healthcare VALUES (
    '38',
    'Private',
    '987'
);

INSERT INTO healthcare VALUES (
    '39',
    'Private',
    '945'
);

INSERT INTO healthcare VALUES (
    '40',
    'Private',
    '477'
);

INSERT INTO healthcare VALUES (
    '41',
    'None',
    '313'
);

INSERT INTO healthcare VALUES (
    '42',
    'None',
    '497'
);

INSERT INTO healthcare VALUES (
    '43',
    'None',
    '397'
);

INSERT INTO healthcare VALUES (
    '44',
    'None',
    '768'
);

INSERT INTO healthcare VALUES (
    '45',
    'Governmental',
    '934'
);

INSERT INTO healthcare VALUES (
    '46',
    'Governmental',
    '686'
);

INSERT INTO healthcare VALUES (
    '47',
    'Governmental',
    '528'
);

INSERT INTO healthcare VALUES (
    '48',
    'None',
    '483'
);

INSERT INTO healthcare VALUES (
    '49',
    'Private',
    '656'
);

INSERT INTO healthcare VALUES (
    '50',
    'Private',
    '168'
);

INSERT INTO healthcare VALUES (
    '51',
    'Private',
    '951'
);

INSERT INTO healthcare VALUES (
    '52',
    'Private',
    '841'
);

INSERT INTO healthcare VALUES (
    '53',
    'Private',
    '163'
);

INSERT INTO healthcare VALUES (
    '54',
    'Private',
    '612'
);

INSERT INTO healthcare VALUES (
    '55',
    'Private',
    '573'
);

INSERT INTO healthcare VALUES (
    '56',
    'Governmental',
    '315'
);

INSERT INTO healthcare VALUES (
    '57',
    'Governmental',
    '743'
);

INSERT INTO healthcare VALUES (
    '58',
    'Governmental',
    '942'
);

INSERT INTO healthcare VALUES (
    '59',
    'Private',
    '621'
);

INSERT INTO healthcare VALUES (
    '60',
    'Private',
    '459'
);

INSERT INTO healthcare VALUES (
    '61',
    'Governmental',
    '257'
);

INSERT INTO healthcare VALUES (
    '62',
    'Governmental',
    '863'
);

INSERT INTO healthcare VALUES (
    '63',
    'Governmental',
    '314'
);

INSERT INTO healthcare VALUES (
    '64',
    'Governmental',
    '162'
);

INSERT INTO healthcare VALUES (
    '65',
    'Governmental',
    '853'
);

INSERT INTO healthcare VALUES (
    '66',
    'Governmental',
    '685'
);

INSERT INTO healthcare VALUES (
    '67',
    'Governmental',
    '476'
);

INSERT INTO healthcare VALUES (
    '68',
    'Private',
    '339'
);

INSERT INTO healthcare VALUES (
    '69',
    'Private',
    '129'
);

INSERT INTO healthcare VALUES (
    '70',
    'None',
    '983'
);

INSERT INTO healthcare VALUES (
    '71',
    'None',
    '141'
);

INSERT INTO healthcare VALUES (
    '73',
    'None',
    '824'
);

INSERT INTO healthcare VALUES (
    '74',
    'None',
    '142'
);

INSERT INTO healthcare VALUES (
    '75',
    'Private',
    '678'
);

INSERT INTO healthcare VALUES (
    '76',
    'None',
    '731'
);

INSERT INTO healthcare VALUES (
    '77',
    'None',
    '891'
);

INSERT INTO healthcare VALUES (
    '78',
    'Governmental',
    '585'
);

INSERT INTO healthcare VALUES (
    '79',
    'Governmental',
    '697'
);

INSERT INTO healthcare VALUES (
    '80',
    'Governmental',
    '643'
);

INSERT INTO healthcare VALUES (
    '81',
    'Private',
    '896'
);

INSERT INTO healthcare VALUES (
    '82',
    'Private',
    '888'
);

INSERT INTO healthcare VALUES (
    '83',
    'Private',
    '646'
);

INSERT INTO healthcare VALUES (
    '84',
    'Private',
    '993'
);

INSERT INTO healthcare VALUES (
    '85',
    'Governmental',
    '412'
);

INSERT INTO healthcare VALUES (
    '86',
    'Governmental',
    '926'
);

INSERT INTO healthcare VALUES (
    '87',
    'None',
    '761'
);

INSERT INTO healthcare VALUES (
    '88',
    'Private',
    '814'
);

INSERT INTO healthcare VALUES (
    '89',
    'Governmental',
    '726'
);

INSERT INTO healthcare VALUES (
    '90',
    'Private',
    '467'
);

INSERT INTO healthcare VALUES (
    '91',
    'Governmental',
    '941'
);

INSERT INTO healthcare VALUES (
    '92',
    'Governmental',
    '361'
);

INSERT INTO healthcare VALUES (
    '93',
    'Private',
    '512'
);

INSERT INTO healthcare VALUES (
    '94',
    'None',
    '331'
);

INSERT INTO healthcare VALUES (
    '95',
    'Private',
    '326'
);

INSERT INTO healthcare VALUES (
    '96',
    'None',
    '244'
);

INSERT INTO healthcare VALUES (
    '97',
    'None',
    '636'
);

INSERT INTO healthcare VALUES (
    '98',
    'None',
    '639'
);

INSERT INTO healthcare VALUES (
    '99',
    'None',
    '254'
);

INSERT INTO healthcare VALUES (
    '100',
    'None',
    '253'
);

INSERT INTO healthcare VALUES (
    '101',
    'Private',
    '449'
);

INSERT INTO healthcare VALUES (
    '102',
    'Private',
    '756'
);

INSERT INTO healthcare VALUES (
    '103',
    'Private',
    '243'
);

INSERT INTO healthcare VALUES (
    '104',
    'None',
    '698'
);

INSERT INTO healthcare VALUES (
    '105',
    'None',
    '717'
);

INSERT INTO healthcare VALUES (
    '106',
    'Governmental',
    '412'
);

INSERT INTO healthcare VALUES (
    '107',
    'Private',
    '548'
);

INSERT INTO healthcare VALUES (
    '108',
    'Private',
    '624'
);

INSERT INTO healthcare VALUES (
    '109',
    'Private',
    '755'
);

INSERT INTO healthcare VALUES (
    '110',
    'None',
    '236'
);

INSERT INTO healthcare VALUES (
    '111',
    'Governmental',
    '651'
);

INSERT INTO healthcare VALUES (
    '112',
    'Governmental',
    '671'
);

INSERT INTO healthcare VALUES (
    '113',
    'Governmental',
    '794'
);

INSERT INTO healthcare VALUES (
    '114',
    'None',
    '191'
);

INSERT INTO healthcare VALUES (
    '115',
    'Private',
    '316'
);

INSERT INTO healthcare VALUES (
    '116',
    'Private',
    '788'
);

INSERT INTO healthcare VALUES (
    '117',
    'None',
    '729'
);

INSERT INTO healthcare VALUES (
    '118',
    'None',
    '381'
);

INSERT INTO healthcare VALUES (
    '119',
    'Private',
    '871'
);

INSERT INTO healthcare VALUES (
    '120',
    'Governmental',
    '244'
);

INSERT INTO healthcare VALUES (
    '121',
    'Governmental',
    '133'
);

INSERT INTO healthcare VALUES (
    '122',
    'None',
    '548'
);

INSERT INTO healthcare VALUES (
    '123',
    'None',
    '331'
);

INSERT INTO healthcare VALUES (
    '124',
    'None',
    '663'
);

INSERT INTO healthcare VALUES (
    '125',
    'None',
    '599'
);

INSERT INTO healthcare VALUES (
    '126',
    'None',
    '335'
);

INSERT INTO healthcare VALUES (
    '127',
    'None',
    '353'
);

INSERT INTO healthcare VALUES (
    '128',
    'Private',
    '692'
);

INSERT INTO healthcare VALUES (
    '129',
    'Private',
    '647'
);

INSERT INTO healthcare VALUES (
    '130',
    'Private',
    '476'
);

INSERT INTO healthcare VALUES (
    '131',
    'None',
    '647'
);

INSERT INTO healthcare VALUES (
    '132',
    'Private',
    '315'
);

INSERT INTO healthcare VALUES (
    '133',
    'Private',
    '955'
);

INSERT INTO healthcare VALUES (
    '134',
    'Private',
    '356'
);

INSERT INTO test VALUES (
    '0',
    'Prostate-specific antigen screening',
    'Bad',
    '444'
);

INSERT INTO test VALUES (
    '1',
    'Blood pressure screening',
    'Bad',
    '947'
);

INSERT INTO test VALUES (
    '2',
    'Blood pressure screening',
    'Bad',
    '356'
);

INSERT INTO test VALUES (
    '3',
    'CYP450 test',
    'Bad',
    '314'
);

INSERT INTO test VALUES (
    '4',
    'Pap smear',
    'Bad',
    '585'
);

INSERT INTO test VALUES (
    '5',
    'Diabetes risk tests',
    'Good',
    '899'
);

INSERT INTO test VALUES (
    '6',
    'Diabetes risk tests',
    'Good',
    '459'
);

INSERT INTO test VALUES (
    '7',
    'Blood pressure screening',
    'Bad',
    '768'
);

INSERT INTO test VALUES (
    '8',
    'Colonoscopy',
    'Bad',
    '726'
);

INSERT INTO test VALUES (
    '9',
    'Skin cancer exam',
    'Bad',
    '459'
);

INSERT INTO test VALUES (
    '10',
    'Blood pressure screening',
    'Good',
    '191'
);

INSERT INTO test VALUES (
    '11',
    'Pap smear',
    'Good',
    '814'
);

INSERT INTO test VALUES (
    '12',
    'Blood pressure screening',
    'Good',
    '548'
);

INSERT INTO test VALUES (
    '13',
    'Blood pressure screening',
    'Good',
    '824'
);

INSERT INTO test VALUES (
    '14',
    'C-reactive protein test',
    'Bad',
    '695'
);

INSERT INTO test VALUES (
    '15',
    'Skin cancer exam',
    'Bad',
    '646'
);

INSERT INTO test VALUES (
    '16',
    'Stress test',
    'Bad',
    '951'
);

INSERT INTO test VALUES (
    '17',
    'Diabetes risk tests',
    'Good',
    '152'
);

INSERT INTO test VALUES (
    '18',
    'CYP450 test',
    'Good',
    '768'
);

INSERT INTO test VALUES (
    '19',
    'Colonoscopy',
    'Bad',
    '647'
);

INSERT INTO prescription VALUES (
    '1',
    'Liquid',
    191,
    TO_DATE('15/10/2009', 'DD/MM/YYYY'),
    TO_DATE('16/10/2006', 'DD/MM/YYYY'),
    '315'
);

INSERT INTO prescription VALUES (
    '2',
    'Capsules',
    138,
    TO_DATE('27/8/2002', 'DD/MM/YYYY'),
    TO_DATE('5/3/2007', 'DD/MM/YYYY'),
    '945'
);

INSERT INTO prescription VALUES (
    '3',
    'Liquid',
    139,
    TO_DATE('15/4/2006', 'DD/MM/YYYY'),
    TO_DATE('17/3/2015', 'DD/MM/YYYY'),
    '476'
);

INSERT INTO prescription VALUES (
    '4',
    'Capsules',
    29,
    TO_DATE('10/8/2015', 'DD/MM/YYYY'),
    TO_DATE('25/3/2001', 'DD/MM/YYYY'),
    '371'
);

INSERT INTO prescription VALUES (
    '5',
    'Liquid',
    189,
    TO_DATE('21/11/2004', 'DD/MM/YYYY'),
    TO_DATE('7/1/2014', 'DD/MM/YYYY'),
    '983'
);

INSERT INTO prescription VALUES (
    '6',
    'Injections',
    23,
    TO_DATE('17/9/2017', 'DD/MM/YYYY'),
    TO_DATE('18/3/2016', 'DD/MM/YYYY'),
    '497'
);

INSERT INTO prescription VALUES (
    '7',
    'Liquid',
    56,
    TO_DATE('10/8/2014', 'DD/MM/YYYY'),
    TO_DATE('9/10/2017', 'DD/MM/YYYY'),
    '685'
);

INSERT INTO prescription VALUES (
    '8',
    'Drops',
    29,
    TO_DATE('20/3/2001', 'DD/MM/YYYY'),
    TO_DATE('15/8/2005', 'DD/MM/YYYY'),
    '483'
);

INSERT INTO prescription VALUES (
    '9',
    'Capsules',
    71,
    TO_DATE('27/5/2016', 'DD/MM/YYYY'),
    TO_DATE('27/6/2009', 'DD/MM/YYYY'),
    '476'
);

INSERT INTO prescription VALUES (
    '10',
    'Suppositories',
    58,
    TO_DATE('21/5/2007', 'DD/MM/YYYY'),
    TO_DATE('2/1/2004', 'DD/MM/YYYY'),
    '412'
);

INSERT INTO prescription VALUES (
    '11',
    'Capsules',
    136,
    TO_DATE('15/7/2009', 'DD/MM/YYYY'),
    TO_DATE('2/1/2004', 'DD/MM/YYYY'),
    '888'
);

INSERT INTO prescription VALUES (
    '12',
    'Capsules',
    98,
    TO_DATE('30/5/2006', 'DD/MM/YYYY'),
    TO_DATE('16/10/2012', 'DD/MM/YYYY'),
    '381'
);

INSERT INTO prescription VALUES (
    '13',
    'Capsules',
    138,
    TO_DATE('8/12/2007', 'DD/MM/YYYY'),
    TO_DATE('25/9/2001', 'DD/MM/YYYY'),
    '236'
);

INSERT INTO prescription VALUES (
    '14',
    'Injections',
    86,
    TO_DATE('27/12/2001', 'DD/MM/YYYY'),
    TO_DATE('17/11/2011', 'DD/MM/YYYY'),
    '947'
);

INSERT INTO prescription VALUES (
    '15',
    'Tablet',
    40,
    TO_DATE('4/5/2007', 'DD/MM/YYYY'),
    TO_DATE('17/5/2017', 'DD/MM/YYYY'),
    '381'
);

INSERT INTO prescription VALUES (
    '16',
    'Tablet',
    177,
    TO_DATE('15/3/2016', 'DD/MM/YYYY'),
    TO_DATE('29/5/2007', 'DD/MM/YYYY'),
    '528'
);

INSERT INTO prescription VALUES (
    '17',
    'Suppositories',
    103,
    TO_DATE('23/1/2006', 'DD/MM/YYYY'),
    TO_DATE('26/9/2003', 'DD/MM/YYYY'),
    '646'
);

INSERT INTO prescription VALUES (
    '19',
    'Injections',
    46,
    TO_DATE('14/6/2011', 'DD/MM/YYYY'),
    TO_DATE('8/9/2013', 'DD/MM/YYYY'),
    '642'
);

INSERT INTO prescription VALUES (
    '20',
    'Liquid',
    76,
    TO_DATE('13/4/2004', 'DD/MM/YYYY'),
    TO_DATE('6/3/2015', 'DD/MM/YYYY'),
    '899'
);

INSERT INTO prescription VALUES (
    '21',
    'Liquid',
    83,
    TO_DATE('11/2/2015', 'DD/MM/YYYY'),
    TO_DATE('22/2/2014', 'DD/MM/YYYY'),
    '141'
);

INSERT INTO prescription VALUES (
    '22',
    'Capsules',
    65,
    TO_DATE('19/5/2001', 'DD/MM/YYYY'),
    TO_DATE('8/2/2005', 'DD/MM/YYYY'),
    '371'
);

INSERT INTO prescription VALUES (
    '23',
    'Liquid',
    81,
    TO_DATE('13/9/2013', 'DD/MM/YYYY'),
    TO_DATE('25/6/2014', 'DD/MM/YYYY'),
    '353'
);

INSERT INTO prescription VALUES (
    '24',
    'Inhalers',
    45,
    TO_DATE('10/9/2011', 'DD/MM/YYYY'),
    TO_DATE('11/10/2011', 'DD/MM/YYYY'),
    '426'
);

INSERT INTO prescription VALUES (
    '25',
    'Suppositories',
    115,
    TO_DATE('1/1/2006', 'DD/MM/YYYY'),
    TO_DATE('22/7/2014', 'DD/MM/YYYY'),
    '528'
);

INSERT INTO prescription VALUES (
    '26',
    'Capsules',
    69,
    TO_DATE('5/10/2016', 'DD/MM/YYYY'),
    TO_DATE('11/11/2016', 'DD/MM/YYYY'),
    '947'
);

INSERT INTO prescription VALUES (
    '27',
    'Inhalers',
    24,
    TO_DATE('4/2/2016', 'DD/MM/YYYY'),
    TO_DATE('15/1/2011', 'DD/MM/YYYY'),
    '356'
);

INSERT INTO prescription VALUES (
    '28',
    'Capsules',
    12,
    TO_DATE('23/6/2016', 'DD/MM/YYYY'),
    TO_DATE('11/1/2009', 'DD/MM/YYYY'),
    '896'
);

INSERT INTO prescription VALUES (
    '29',
    'Tablet',
    95,
    TO_DATE('18/3/2003', 'DD/MM/YYYY'),
    TO_DATE('22/1/2016', 'DD/MM/YYYY'),
    '331'
);

INSERT INTO prescription VALUES (
    '30',
    'Tablet',
    49,
    TO_DATE('6/8/2005', 'DD/MM/YYYY'),
    TO_DATE('29/9/2009', 'DD/MM/YYYY'),
    '381'
);

INSERT INTO visit VALUES (
    '1',
    TIMESTAMP '2012-12-12 20:1:00',
    TIMESTAMP '2012-12-12 21:38:00',
    'Breast biopsy',
    'scheduled appointment',
    '794'
);

INSERT INTO visit VALUES (
    '2',
    TIMESTAMP '2012-12-12 11:9:00',
    TIMESTAMP '2012-12-12 12:28:00',
    'Carotid endarterectomy',
    'scheduled appointment',
    '257'
);

INSERT INTO visit VALUES (
    '3',
    TIMESTAMP '2012-12-12 14:1:00',
    TIMESTAMP '2012-12-12 17:30:00',
    'Cataract surgery',
    'scheduled appointment',
    '987'
);

INSERT INTO visit VALUES (
    '4',
    TIMESTAMP '2012-12-12 12:8:00',
    TIMESTAMP '2012-12-12 22:3:00',
    'Breast biopsy',
    'walkin',
    '459'
);

INSERT INTO visit VALUES (
    '5',
    TIMESTAMP '2012-12-12 15:53:00',
    TIMESTAMP '2012-12-12 18:57:00',
    'Cataract surgery',
    'walkin',
    '548'
);

INSERT INTO visit VALUES (
    '6',
    TIMESTAMP '2012-12-12 7:25:00',
    TIMESTAMP '2012-12-12 9:3:00',
    'Appendectomy',
    'scheduled appointment',
    '244'
);

INSERT INTO visit VALUES (
    '7',
    TIMESTAMP '2012-12-12 21:58:00',
    TIMESTAMP '2012-12-12 22:37:00',
    'Appendectomy',
    'scheduled appointment',
    '987'
);

INSERT INTO visit VALUES (
    '8',
    TIMESTAMP '2012-12-12 5:27:00',
    TIMESTAMP '2012-12-12 7:18:00',
    'Appendectomy',
    'walkin',
    '678'
);

INSERT INTO visit VALUES (
    '9',
    TIMESTAMP '2012-12-12 22:57:00',
    TIMESTAMP '2012-12-12 23:6:00',
    'Appendectomy',
    'scheduled appointment',
    '663'
);

INSERT INTO visit VALUES (
    '10',
    TIMESTAMP '2012-12-12 4:46:00',
    TIMESTAMP '2012-12-12 5:56:00',
    'Appendectomy',
    'walkin',
    '836'
);

INSERT INTO visit VALUES (
    '11',
    TIMESTAMP '2012-12-12 18:57:00',
    TIMESTAMP '2012-12-12 20:23:00',
    'Coronary artery bypass',
    'scheduled appointment',
    '626'
);

INSERT INTO visit VALUES (
    '12',
    TIMESTAMP '2012-12-12 20:20:00',
    TIMESTAMP '2012-12-12 23:52:00',
    'Coronary artery bypass',
    'scheduled appointment',
    '573'
);

INSERT INTO visit VALUES (
    '13',
    TIMESTAMP '2012-12-12 21:2:00',
    TIMESTAMP '2012-12-12 21:10:00',
    'Cesarean section',
    'walkin',
    '163'
);

INSERT INTO visit VALUES (
    '14',
    TIMESTAMP '2012-12-12 18:36:00',
    TIMESTAMP '2012-12-12 19:38:00',
    'Appendectomy',
    'scheduled appointment',
    '476'
);

INSERT INTO visit VALUES (
    '15',
    TIMESTAMP '2012-12-12 16:28:00',
    TIMESTAMP '2012-12-12 19:22:00',
    'Appendectomy',
    'walkin',
    '243'
);

INSERT INTO visit VALUES (
    '16',
    TIMESTAMP '2012-12-12 22:6:00',
    TIMESTAMP '2012-12-12 23:23:00',
    'Breast biopsy',
    'walkin',
    '196'
);

INSERT INTO visit VALUES (
    '17',
    TIMESTAMP '2012-12-12 10:20:00',
    TIMESTAMP '2012-12-12 11:6:00',
    'Breast biopsy',
    'scheduled appointment',
    '686'
);

INSERT INTO visit VALUES (
    '18',
    TIMESTAMP '2012-12-12 17:44:00',
    TIMESTAMP '2012-12-12 20:19:00',
    'Carotid endarterectomy',
    'walkin',
    '871'
);

INSERT INTO visit VALUES (
    '19',
    TIMESTAMP '2012-12-12 8:10:00',
    TIMESTAMP '2012-12-12 10:12:00',
    'Appendectomy',
    'scheduled appointment',
    '814'
);

INSERT INTO visit VALUES (
    '20',
    TIMESTAMP '2012-12-12 12:10:00',
    TIMESTAMP '2012-12-12 13:30:00',
    'Cholecystectomy',
    'scheduled appointment',
    '656'
);

INSERT INTO visit VALUES (
    '21',
    TIMESTAMP '2012-12-12 9:16:00',
    TIMESTAMP '2012-12-12 10:36:00',
    'Coronary artery bypass',
    'walkin',
    '315'
);

INSERT INTO visit VALUES (
    '22',
    TIMESTAMP '2012-12-12 1:58:00',
    TIMESTAMP '2012-12-12 4:43:00',
    'Coronary artery bypass',
    'walkin',
    '717'
);

INSERT INTO visit VALUES (
    '23',
    TIMESTAMP '2012-12-12 19:52:00',
    TIMESTAMP '2012-12-12 22:10:00',
    'Cataract surgery',
    'scheduled appointment',
    '942'
);

INSERT INTO visit VALUES (
    '24',
    TIMESTAMP '2012-12-12 16:36:00',
    TIMESTAMP '2012-12-12 19:58:00',
    'Appendectomy',
    'scheduled appointment',
    '412'
);

INSERT INTO visit VALUES (
    '25',
    TIMESTAMP '2012-12-12 10:59:00',
    TIMESTAMP '2012-12-12 12:28:00',
    'Carotid endarterectomy',
    'walkin',
    '643'
);

INSERT INTO visit VALUES (
    '26',
    TIMESTAMP '2012-12-12 10:36:00',
    TIMESTAMP '2012-12-12 13:53:00',
    'Coronary artery bypass',
    'walkin',
    '963'
);

INSERT INTO visit VALUES (
    '27',
    TIMESTAMP '2012-12-12 2:13:00',
    TIMESTAMP '2012-12-12 4:32:00',
    'Carotid endarterectomy',
    'walkin',
    '163'
);

INSERT INTO visit VALUES (
    '28',
    TIMESTAMP '2012-12-12 4:33:00',
    TIMESTAMP '2012-12-12 6:40:00',
    'Cholecystectomy',
    'walkin',
    '314'
);

INSERT INTO visit VALUES (
    '29',
    TIMESTAMP '2012-12-12 5:16:00',
    TIMESTAMP '2012-12-12 6:13:00',
    'Cesarean section',
    'scheduled appointment',
    '274'
);

INSERT INTO visit VALUES (
    '30',
    TIMESTAMP '2012-12-12 11:37:00',
    TIMESTAMP '2012-12-12 13:55:00',
    'Cholecystectomy',
    'scheduled appointment',
    '692'
);

INSERT INTO sample VALUES (
    '1',
    'Skin',
    '888'
);

INSERT INTO sample VALUES (
    '2',
    'Urine',
    '889'
);

INSERT INTO sample VALUES (
    '3',
    'Blood',
    '888'
);

INSERT INTO sample VALUES (
    '4',
    'Urine',
    '889'
);

INSERT INTO sample VALUES (
    '5',
    'Skin',
    '871'
);

INSERT INTO sample VALUES (
    '6',
    'Blood',
    '934'
);

INSERT INTO sample VALUES (
    '7',
    'Blood',
    '761'
);

INSERT INTO sample VALUES (
    '8',
    'Urine',
    '853'
);

INSERT INTO sample VALUES (
    '9',
    'Blood',
    '693'
);

INSERT INTO sample VALUES (
    '10',
    'Urine',
    '814'
);

INSERT INTO sample VALUES (
    '11',
    'Blood',
    '733'
);

INSERT INTO sample VALUES (
    '12',
    'Urine',
    '335'
);

INSERT INTO sample VALUES (
    '13',
    'Urine',
    '849'
);

INSERT INTO sample VALUES (
    '14',
    'Urine',
    '685'
);

INSERT INTO sample VALUES (
    '15',
    'Urine',
    '697'
);

INSERT INTO sample VALUES (
    '16',
    'Blood',
    '326'
);

INSERT INTO sample VALUES (
    '17',
    'Blood',
    '585'
);

INSERT INTO sample VALUES (
    '18',
    'Skin',
    '254'
);

INSERT INTO sample VALUES (
    '19',
    'Skin',
    '353'
);

INSERT INTO sample VALUES (
    '20',
    'Skin',
    '243'
);

INSERT INTO sample VALUES (
    '21',
    'Blood',
    '983'
);

INSERT INTO sample VALUES (
    '22',
    'Blood',
    '476'
);

INSERT INTO sample VALUES (
    '23',
    'Urine',
    '142'
);

INSERT INTO sample VALUES (
    '24',
    'Skin',
    '814'
);

INSERT INTO sample VALUES (
    '25',
    'Urine',
    '356'
);

INSERT INTO sample VALUES (
    '26',
    'Urine',
    '316'
);

INSERT INTO sample VALUES (
    '27',
    'Blood',
    '945'
);

INSERT INTO sample VALUES (
    '28',
    'Blood',
    '849'
);

INSERT INTO sample VALUES (
    '29',
    'Urine',
    '729'
);

INSERT INTO sample VALUES (
    '30',
    'Blood',
    '426'
);

INSERT INTO bill VALUES (
    '1',
    184.84,
    '141',
    TO_DATE('12/12/2006', 'DD/MM/YYYY'),
    'Stress test',
    '124.42'
);

INSERT INTO bill VALUES (
    '2',
    133.95,
    '162',
    TO_DATE('8/9/2011', 'DD/MM/YYYY'),
    'Stress test',
    '54.47'
);

INSERT INTO bill VALUES (
    '3',
    27.97,
    '695',
    TO_DATE('30/6/2006', 'DD/MM/YYYY'),
    'Diabetes risk tests',
    '8.13'
);

INSERT INTO bill VALUES (
    '4',
    43.37,
    '926',
    TO_DATE('26/8/2003', 'DD/MM/YYYY'),
    'Skin cancer exam',
    '24.99'
);

INSERT INTO bill VALUES (
    '5',
    35.89,
    '726',
    TO_DATE('25/9/2010', 'DD/MM/YYYY'),
    'Skin cancer exam',
    '7.55'
);

INSERT INTO bill VALUES (
    '6',
    58.62,
    '983',
    TO_DATE('5/7/2004', 'DD/MM/YYYY'),
    'CYP450 test',
    '16.25'
);

INSERT INTO bill VALUES (
    '7',
    35.18,
    '896',
    TO_DATE('16/12/2005', 'DD/MM/YYYY'),
    'Skin cancer exam',
    '30.76'
);

INSERT INTO bill VALUES (
    '8',
    95.14,
    '141',
    TO_DATE('9/9/2007', 'DD/MM/YYYY'),
    'Blood pressure screening',
    '81.90'
);

INSERT INTO bill VALUES (
    '9',
    186.48,
    '599',
    TO_DATE('29/6/2016', 'DD/MM/YYYY'),
    'Blood pressure screening',
    '57.72'
);

INSERT INTO bill VALUES (
    '10',
    165.75,
    '639',
    TO_DATE('20/2/2015', 'DD/MM/YYYY'),
    'Colonoscopy',
    '154.24'
);

INSERT INTO bill VALUES (
    '11',
    20.16,
    '253',
    TO_DATE('14/3/2009', 'DD/MM/YYYY'),
    'Pap smear',
    '0.92'
);

INSERT INTO bill VALUES (
    '12',
    31.51,
    '697',
    TO_DATE('5/11/2000', 'DD/MM/YYYY'),
    'C-reactive protein test',
    '22.67'
);

INSERT INTO bill VALUES (
    '13',
    77.72,
    '955',
    TO_DATE('10/6/2009', 'DD/MM/YYYY'),
    'C-reactive protein test',
    '48.31'
);

INSERT INTO bill VALUES (
    '14',
    118.76,
    '896',
    TO_DATE('24/3/2014', 'DD/MM/YYYY'),
    'Diabetes risk tests',
    '47.32'
);

INSERT INTO bill VALUES (
    '15',
    63.98,
    '134',
    TO_DATE('6/3/2013', 'DD/MM/YYYY'),
    'Blood pressure screening',
    '8.13'
);

INSERT INTO bill VALUES (
    '16',
    59.51,
    '993',
    TO_DATE('30/1/2005', 'DD/MM/YYYY'),
    'Colonoscopy',
    '13.84'
);

INSERT INTO bill VALUES (
    '17',
    174.31,
    '162',
    TO_DATE('16/11/2012', 'DD/MM/YYYY'),
    'Prostate-specific antigen screening',
    '101.87'
);

INSERT INTO bill VALUES (
    '18',
    52.89,
    '756',
    TO_DATE('16/6/2002', 'DD/MM/YYYY'),
    'Colonoscopy',
    '45.93'
);

INSERT INTO bill VALUES (
    '19',
    101.36,
    '331',
    TO_DATE('3/6/2012', 'DD/MM/YYYY'),
    'Prostate-specific antigen screening',
    '68.12'
);

INSERT INTO bill VALUES (
    '20',
    96.88,
    '168',
    TO_DATE('22/3/2007', 'DD/MM/YYYY'),
    'Diabetes risk tests',
    '11.89'
);

INSERT INTO bill VALUES (
    '21',
    156.39,
    '853',
    TO_DATE('27/5/2015', 'DD/MM/YYYY'),
    'C-reactive protein test',
    '146.76'
);

INSERT INTO bill VALUES (
    '22',
    171.01,
    '412',
    TO_DATE('27/5/2009', 'DD/MM/YYYY'),
    'C-reactive protein test',
    '74.27'
);

INSERT INTO bill VALUES (
    '23',
    146.70,
    '274',
    TO_DATE('15/7/2012', 'DD/MM/YYYY'),
    'Prostate-specific antigen screening',
    '19.94'
);

INSERT INTO bill VALUES (
    '24',
    159.80,
    '426',
    TO_DATE('2/4/2002', 'DD/MM/YYYY'),
    'Blood pressure screening',
    '30.14'
);

INSERT INTO bill VALUES (
    '25',
    66.90,
    '191',
    TO_DATE('6/7/2017', 'DD/MM/YYYY'),
    'Stress test',
    '34.71'
);

INSERT INTO bill VALUES (
    '26',
    91.21,
    '476',
    TO_DATE('29/10/2009', 'DD/MM/YYYY'),
    'Stress test',
    '78.24'
);

INSERT INTO bill VALUES (
    '27',
    160.72,
    '449',
    TO_DATE('22/11/2003', 'DD/MM/YYYY'),
    'Skin cancer exam',
    '2.51'
);

INSERT INTO bill VALUES (
    '28',
    56.03,
    '612',
    TO_DATE('5/7/2013', 'DD/MM/YYYY'),
    'C-reactive protein test',
    '2.23'
);

INSERT INTO bill VALUES (
    '29',
    89.54,
    '853',
    TO_DATE('7/1/2017', 'DD/MM/YYYY'),
    'C-reactive protein test',
    '64.99'
);

INSERT INTO bill VALUES (
    '30',
    142.35,
    '331',
    TO_DATE('11/5/2003', 'DD/MM/YYYY'),
    'Prostate-specific antigen screening',
    '86.92'
);

INSERT INTO room VALUES (
    1,
    'Pharmacy'
);

INSERT INTO room VALUES (
    2,
    'Lab'
);

INSERT INTO room VALUES (
    3,
    'Birthing Room'
);

INSERT INTO room VALUES (
    4,
    'Operating Room'
);

INSERT INTO room VALUES (
    5,
    'Consultation Room'
);

INSERT INTO room VALUES (
    6,
    'Examination Room'
);

INSERT INTO room VALUES (
    7,
    'Consultation Room'
);

INSERT INTO room VALUES (
    8,
    'Examination Room'
);

INSERT INTO room VALUES (
    9,
    'Consultation Room'
);

INSERT INTO room VALUES (
    10,
    'Examination Room'
);

INSERT INTO room VALUES (
    11,
    'Consultation Room'
);

INSERT INTO room VALUES (
    12,
    'Examination Room'
);

INSERT INTO room VALUES (
    13,
    'Consultation Room'
);

INSERT INTO room VALUES (
    14,
    'Examination Room'
);

INSERT INTO room VALUES (
    15,
    'Consultation Room'
);

INSERT INTO room VALUES (
    16,
    'Examination Room'
);

INSERT INTO room VALUES (
    17,
    'Consultation Room'
);

INSERT INTO room VALUES (
    18,
    'Examination Room'
);

INSERT INTO room VALUES (
    19,
    'Consultation Room'
);

INSERT INTO room VALUES (
    20,
    'Examination Room'
);

INSERT INTO room VALUES (
    21,
    'Consultation Room'
);

INSERT INTO room VALUES (
    22,
    'Examination Room'
);

INSERT INTO room VALUES (
    23,
    'Consultation Room'
);

INSERT INTO room VALUES (
    24,
    'Examination Room'
);

INSERT INTO room VALUES (
    25,
    'Nurses Station'
);

INSERT INTO room VALUES (
    26,
    'Administrative Office'
);

INSERT INTO room VALUES (
    27,
    'Waiting Room'
);

INSERT INTO room VALUES (
    28,
    'Recovery Room'
);

INSERT INTO or_room_schedule VALUES (
    '1',
    'Example Notes',
    '1',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '2',
    'Example Notes',
    '2',
    '4',
    '242',
    '449'
);

INSERT INTO or_room_schedule VALUES (
    '3',
    'Example Notes',
    '3',
    '4',
    '242',
    '449'
);

INSERT INTO or_room_schedule VALUES (
    '4',
    'Example Notes',
    '4',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '5',
    'Example Notes',
    '5',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '6',
    'Example Notes',
    '6',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '7',
    'Example Notes',
    '7',
    '4',
    '242',
    '449'
);

INSERT INTO or_room_schedule VALUES (
    '8',
    'Example Notes',
    '8',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '9',
    'Example Notes',
    '9',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '10',
    'Example Notes',
    '10',
    '4',
    '242',
    '449'
);

INSERT INTO or_room_schedule VALUES (
    '11',
    'Example Notes',
    '11',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '12',
    'Example Notes',
    '12',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '13',
    'Example Notes',
    '13',
    '4',
    '242',
    '449'
);

INSERT INTO or_room_schedule VALUES (
    '14',
    'Example Notes',
    '14',
    '4',
    '242',
    '449'
);

INSERT INTO or_room_schedule VALUES (
    '15',
    'Example Notes',
    '15',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '16',
    'Example Notes',
    '16',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '17',
    'Example Notes',
    '17',
    '4',
    '242',
    '449'
);

INSERT INTO or_room_schedule VALUES (
    '18',
    'Example Notes',
    '18',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '19',
    'Example Notes',
    '19',
    '4',
    '242',
    '449'
);

INSERT INTO or_room_schedule VALUES (
    '20',
    'Example Notes',
    '20',
    '4',
    '242',
    '449'
);

INSERT INTO or_room_schedule VALUES (
    '21',
    'Example Notes',
    '21',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '22',
    'Example Notes',
    '22',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '23',
    'Example Notes',
    '23',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '24',
    'Example Notes',
    '24',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '25',
    'Example Notes',
    '25',
    '4',
    '242',
    '449'
);

INSERT INTO or_room_schedule VALUES (
    '26',
    'Example Notes',
    '26',
    '4',
    '242',
    '449'
);

INSERT INTO or_room_schedule VALUES (
    '27',
    'Example Notes',
    '27',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '28',
    'Example Notes',
    '28',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '29',
    'Example Notes',
    '29',
    '4',
    '242',
    '742'
);

INSERT INTO or_room_schedule VALUES (
    '30',
    'Example Notes',
    '30',
    '4',
    '242',
    '449'
);

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