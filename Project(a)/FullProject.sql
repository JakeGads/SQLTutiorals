--drop
--Jake
Drop Table  Person 			        CASCADE CONSTRAINTS;
Drop Table  Employee 		    	CASCADE CONSTRAINTS;
Drop Table  Nurse_Practitioner  	CASCADE CONSTRAINTS;
Drop Table  Registered_Nurse    	CASCADE CONSTRAINTS;
Drop Table  Pharmacist          	CASCADE CONSTRAINTS;
Drop Table  Medical_Technician  	CASCADE CONSTRAINTS;
Drop Table  Midwives              	CASCADE CONSTRAINTS;
Drop Table  Physician           	CASCADE CONSTRAINTS;
Drop Table  Office_Admin        	CASCADE CONSTRAINTS;
Drop Table  Receptionist        	CASCADE CONSTRAINTS;
Drop Table  Book_Keeper         	CASCADE CONSTRAINTS;
Drop Table  Bill                	CASCADE CONSTRAINTS;
Drop Table  Room                	CASCADE CONSTRAINTS;
--Lauren 
drop table 	healthcare 			     cascade constraints;
/*
drop table 	privateHealthCare 		 cascade constraints;
drop table 	governmentalHealthCare 	 cascade constraints;
*/
drop table 	test 				     cascade constraints;
drop table 	prescription 		     cascade constraints;
drop table 	patient 			     cascade constraints;
drop table 	visit 				     cascade constraints;
drop table 	sample 				     cascade constraints;


--Jake
--create table
--will make 100
Create Table Person(
	Person_ID	varchar2(20),
	Name		varchar2(30),
	Street		varchar2(30),
    City        varchar2(30),
    State       varchar2(30),
    Zip         varchar2(30),
	PhoneNum	varchar2(30),
	
	Constraint Person_pk Primary Key (Person_ID)
);

--This is also Lauren's but its been moved up here becuase it make sense for it to be here
create table patient(
	patient_ID varchar2(20),
	Person_ID		varchar2(20),
	Constraint patient_fk 	Foreign Key (Person_ID) 	REFERENCES Person(Person_ID),
	Constraint patient_pk primary key (patient_ID)
);

Create Table Employee(
	Employee_ID		varchar2(20),
	
	Person_ID		varchar2(20),
	Constraint Employee_fk 	Foreign Key (Person_ID) 	REFERENCES Person(Person_ID),
	
	Constraint Employee_pk 	Primary Key (Employee_ID)
	
);

Create Table Nurse_practitioner(
	NP_ID		varchar2(20),
	
	Employee_ID		varchar2(20),
	Constraint Nurse_practitioner_fk 	Foreign Key (Employee_ID) 	REFERENCES Employee(Employee_ID),
	
	Constraint Nurse_practitioner_pk Primary Key (NP_ID)
);

Create Table Registered_Nurse(
	Registered_Nurse_ID		varchar2(20),
	
	Employee_ID		varchar2(20),
	Constraint Registered_Nurse_fk 	Foreign Key (Employee_ID) 	REFERENCES Employee(Employee_ID),
	
	Constraint Registered_Nurse_pk Primary Key (Registered_Nurse_ID)
);

Create Table Pharmacist(
	Pharmacist_ID		varchar2(20),
	
	Employee_ID			varchar2(20),
	Constraint Pharmacist_fk 	Foreign Key (Employee_ID) 	REFERENCES Employee(Employee_ID),
	
	Constraint Pharmacist_pk Primary Key (Pharmacist_ID)
);

Create Table Medical_Technician(
	MT_ID				varchar2(20),
	
	Employee_ID		varchar2(20),
	Constraint Medical_Technician_fk 	Foreign Key (Employee_ID) 	REFERENCES Employee(Employee_ID),
	
	Constraint Medical_Technician_pk Primary Key (MT_ID)
);

Create Table Midwives(
	MW_ID				varchar2(20),
	
	Employee_ID			varchar2(20),
	Constraint Midwives_fk 	Foreign Key (Employee_ID) 	REFERENCES Employee(Employee_ID),
    
	Constraint Midwives_pk Primary Key (MW_ID)
);

Create Table Physician(
	Physician_ID		varchar2(20),
    Employee_ID		varchar2(20),
	Speciality          varchar2(20),
	Constraint Physician_fk 	Foreign Key (Employee_ID) 	REFERENCES Employee(Employee_ID),
    Constraint Speciality_Check check (speciality = 'Physician' or speciality = 'Surgeon' or speciality = 'Pediatrician'),
	Constraint Physician_pk Primary Key (Physician_ID)
);

Create Table Office_Admin(
    OA_ID               varchar2(20),
	
	Employee_ID		varchar2(20),
	Constraint Office_Admin_fk 	Foreign Key (Employee_ID) 	REFERENCES Employee(Employee_ID),
	
    Constraint Office_Admin_pk Primary Key (OA_ID)
);

Create Table Receptionist(
    R_ID                varchar2(20),
	
	Employee_ID		varchar2(20),	
	Constraint Receptionist_fk 	Foreign Key (Employee_ID) 	REFERENCES Employee(Employee_ID),
	
    Constraint Receptionist_pk Primary Key (R_ID)
);

Create Table Book_Keeper(
    Book_Keeper_ID               varchar2(20),
	
	Employee_ID		varchar2(20),
	Constraint Book_Keeper_fk 	Foreign Key (Employee_ID) 	REFERENCES Employee(Employee_ID),
	
    Constraint Book_Keeper Primary Key (Book_Keeper_ID)
);

Create Table Bill(
    Bill_ID     varchar2(20),
    Bill_Price  number,
	
    Patient_ID		varchar2(20),
	Constraint Bill_fk 	Foreign Key (Patient_ID) 	REFERENCES Patient(Patient_ID),
	
    Constraint Bill_pk Primary Key (Bill_ID)
);

Create Table Room(
    Room_ID     varchar2(20),
    Room_Type    varchar2(20),
    
    Constraint Room_Check check (
    Room_Type = 'Pharmacy' or 
    Room_Type = 'Lab' or 
    Room_Type = 'Birthing Room' or
    Room_Type = 'Operating Room' or
    Room_Type = 'Consultation Room' or
    Room_Type = 'Examination Room' or
    Room_Type = 'Nurses Station' or
    Room_Type = 'Administrative Office' or
    Room_Type = 'Waiting Room' or
    Room_Type = 'Recovery Room'
    ),
    Constraint Room_pk Primary Key (Room_ID)
);

--Lauren
create table healthcare(
	Health_Care_ID  varchar2(20),
	Type 	       varchar2(25),
	CONSTRAINT Type_Check check(Type  = 'None' or Type = 'Governmental' or Type = 'Private'),
	
	patient_ID		varchar2(20),
	Constraint healthcare_fk 	Foreign Key (patient_ID) 	REFERENCES patient(patient_ID),

	
	constraint Health_Care_pk primary key (Health_Care_ID)
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

create table test(
	test_ID   varchar2(20),
	type	  varchar2(75),
	result	  varchar2(75),
	
	Patient_ID		varchar2(20),
	Constraint test_fk 	Foreign Key (Patient_ID) 	REFERENCES Patient(Patient_ID),
	
	constraint test_pk primary key (test_ID)
);

--Talk about this one
create table prescription(
	prescription_ID varchar2(20),
	medicine_type 	varchar2(20),
	amount		int,
	original_date	date,
	filled_date	date,
	
	Patient_ID		varchar2(20),
	Constraint prescription_fk 	Foreign Key (Patient_ID) 	REFERENCES Patient(Patient_ID),
	
	constraint prescription_pk primary key (prescription_ID)
);

create table visit(
	visit_ID  varchar2(20),
	visit_date	  date,
	type	  varchar2(21),
	
	Patient_ID		varchar2(20),
	Constraint visit_fk 	Foreign Key (Patient_ID) 	REFERENCES Patient(Patient_ID),
	
	Constraint visit_type_check check (
	type = 'walkin' or
	type = 'scheduled appointment'
    ),
    
	/*
	 we can me these constrants
	walkin, (MAKE TABLE????)
	scheduled appointment (MAKE TABLE????)
	contraint visit_fk foreign key (visit_ID) references patient (patient_ID),
	*/
	constraint visit_pk primary key (visit_ID) 
);

create table sample(
	sample_ID varchar2(20),
	type	varchar2(20),

    Patient_ID		varchar2(20),
	Constraint sample_fk 	Foreign Key (Patient_ID) 	REFERENCES Patient(Patient_ID),
	
	
    
	constraint sample_pk primary key (sample_ID)
);

--Values Assigned via a random genorator then comb through for corrections
Insert Into person Values ('885', 'Kaitlin  Puggioni' ,'658 High Street', 'Center Valley','PA','37619', '939-796-8639');
Insert Into person Values ('961', 'Terica  Archer' ,'121 Route 41', 'Center Valley','PA','37619', '184-652-8324');
Insert Into person Values ('831', 'Dorene  Masse' ,'139 Fairway Drive', 'Center Valley','PA','37619', '983-535-9425');
Insert Into person Values ('792', 'Janean  Masse' ,'736 Linda Lane', 'Center Valley','PA','37619', '585-664-7867');
Insert Into person Values ('592', 'Viola  Mohammed' ,'259 Court Street', 'Center Valley','PA','37619', '834-468-5433');
Insert Into person Values ('368', 'Clifford  Greer' ,'519 Valley View Drive', 'Center Valley','PA','37619', '944-121-7864');
Insert Into person Values ('661', 'Cleo  Strobach' ,'447 Virginia Street', 'Center Valley','PA','37619', '721-628-8459');
Insert Into person Values ('454', 'Annett  Fanger' ,'849 Poplar Street', 'Center Valley','PA','37619', '849-347-2227');
Insert Into person Values ('416', 'Andre  Melendez' ,'988 Brown Street', 'Center Valley','PA','37619', '827-852-6781');
Insert Into person Values ('956', 'Zulma  Witherell' ,'356 Virginia Avenue', 'Center Valley','PA','37619', '631-211-8329');
Insert Into person Values ('822', 'Reinaldo  Bottiroli' ,'555 Columbia Street', 'Center Valley','PA','37619', '877-789-3763');
Insert Into person Values ('922', 'Sonia  Santamaria' ,'588 8th Avenue', 'Center Valley','PA','37619', '188-849-4497');
Insert Into person Values ('842', 'Rosanne  Herold' ,'564 Rosewood Drive', 'Center Valley','PA','37619', '898-643-5318');
Insert Into person Values ('837', 'Domingo  Castillo' ,'265 Riverside Drive', 'Center Valley','PA','37619', '715-736-9452');
Insert Into person Values ('696', 'Fransisca  Hollander' ,'431 Lilac Lane', 'Center Valley','PA','37619', '497-225-9245');
Insert Into person Values ('169', 'Tamica  Lemessurier' ,'646 Ashley Court', 'Center Valley','PA','37619', '946-255-8435');
Insert Into person Values ('932', 'Shasta  Zorich' ,'581 Creekside Drive', 'Center Valley','PA','37619', '981-987-2692');
Insert Into person Values ('811', 'Bryon  Bosanac' ,'445 East Avenue', 'Center Valley','PA','37619', '196-496-8472');
Insert Into person Values ('277', 'Rod  Richer' ,'912 Dogwood Lane', 'Center Valley','PA','37619', '279-899-2542');
Insert Into person Values ('362', 'Domingo  Goethe' ,'335 Eagle Street', 'Center Valley','PA','37619', '823-751-6657');
Insert Into person Values ('634', 'Marni  Ousley' ,'544 Park Place', 'Center Valley','PA','37619', '814-655-3712');
Insert Into person Values ('195', 'Anabel  Torelli' ,'389 Street Road', 'Center Valley','PA','37619', '923-937-2178');
Insert Into person Values ('372', 'Glenna  Bisbee' ,'677 Monroe Drive', 'Center Valley','PA','37619', '532-315-6816');
Insert Into person Values ('738', 'Sydney  Ivanoff' ,'649 Fulton Street', 'Center Valley','PA','37619', '532-184-9122');
Insert Into person Values ('996', 'Jayne  Deng' ,'332 Victoria Court', 'Center Valley','PA','37619', '642-696-8834');
Insert Into person Values ('479', 'Dianne  Jagger' ,'389 Lawrence Street', 'Center Valley','PA','37619', '898-792-1354');
Insert Into person Values ('133', 'Marni  Anker' ,'127 Hill Street', 'Center Valley','PA','37619', '975-761-6113');
Insert Into person Values ('852', 'Reinaldo  Maccormick' ,'263 Willow Lane', 'Center Valley','PA','37619', '944-641-8679');
Insert Into person Values ('863', 'Meghann  Schneiderman' ,'534 Cherry Street', 'Center Valley','PA','37619', '232-824-1268');
Insert Into person Values ('742', 'Dale  Carrier' ,'799 Academy Street', 'Center Valley','PA','37619', '582-375-5865');
Insert Into person Values ('566', 'Yoshiko  Newsweek' ,'693 Sycamore Lane', 'Center Valley','PA','37619', '917-455-6139');
Insert Into person Values ('184', 'Edwardo  Yanowitz' ,'647 Rose Street', 'Center Valley','PA','37619', '439-144-3496');
Insert Into person Values ('215', 'Hildred  Boss' ,'229 9th Street', 'Center Valley','PA','37619', '194-718-8524');
Insert Into person Values ('625', 'Taren  Flynn-johnson' ,'631 Penn Street', 'Center Valley','PA','37619', '384-799-2369');
Insert Into person Values ('588', 'Trina  Sams' ,'487 9th Street West', 'Center Valley','PA','37619', '942-854-1722');
Insert Into person Values ('375', 'Rickey  Fearn' ,'755 Hill Street', 'Center Valley','PA','37619', '996-637-4747');
Insert Into person Values ('125', 'Zula  Stirling' ,'435 Virginia Street', 'Center Valley','PA','37619', '572-156-3646');
Insert Into person Values ('884', 'Andria  Mead' ,'152 Brook Lane', 'Center Valley','PA','37619', '672-941-6563');
Insert Into person Values ('475', 'Shannan  Ouderkirk' ,'194 Woodland Drive', 'Center Valley','PA','37619', '275-463-5552');
Insert Into person Values ('319', 'Efren  Kline' ,'691 Cooper Street', 'Center Valley','PA','37619', '646-776-6838');
Insert Into person Values ('182', 'Lavenia  Hanify' ,'251 Oak Avenue', 'Center Valley','PA','37619', '218-135-6194');
Insert Into person Values ('111', 'Pauline  Runnalls' ,'637 Manor Drive', 'Center Valley','PA','37619', '535-342-4812');
Insert Into person Values ('377', 'Kaylene  Vaillancourt' ,'229 Old York Road', 'Center Valley','PA','37619', '728-519-9687');
Insert Into person Values ('339', 'Elizabet  Rosania' ,'544 Shady Lane', 'Center Valley','PA','37619', '329-383-3725');
Insert Into person Values ('471', 'Jacki  Ivanoff' ,'286 Willow Lane', 'Center Valley','PA','37619', '938-224-5745');
Insert Into person Values ('535', 'Leonard  Slattery' ,'447 Academy Street', 'Center Valley','PA','37619', '786-172-1657');
Insert Into person Values ('575', 'Domingo  Usseglio' ,'224 Orchard Avenue', 'Center Valley','PA','37619', '751-772-5796');
Insert Into person Values ('817', 'Glenna  Wortis' ,'164 Colonial Drive', 'Center Valley','PA','37619', '864-883-4237');
Insert Into person Values ('967', 'Dora  Haworth' ,'758 Park Drive', 'Center Valley','PA','37619', '253-925-2277');
Insert Into person Values ('467', 'Kyong  Torelli' ,'142 Crescent Street', 'Center Valley','PA','37619', '583-796-1693');
Insert Into person Values ('853', 'Trista  Prizer' ,'317 2nd Avenue', 'Center Valley','PA','37619', '271-357-5246');
Insert Into person Values ('829', 'Vicenta  Greenwald' ,'898 4th Street', 'Center Valley','PA','37619', '414-674-6462');
Insert Into person Values ('954', 'Beatrice  Alongi' ,'266 Prospect Avenue', 'Center Valley','PA','37619', '788-532-2894');
Insert Into person Values ('494', 'Earl  Kittler' ,'295 Linden Street', 'Center Valley','PA','37619', '425-869-3555');
Insert Into person Values ('142', 'Sade  Witherell' ,'126 Route 41', 'Center Valley','PA','37619', '522-396-8567');
Insert Into person Values ('767', 'Tyron  Anker' ,'485 South Street', 'Center Valley','PA','37619', '321-576-3851');
Insert Into person Values ('896', 'Allan  Piessens' ,'268 North Avenue', 'Center Valley','PA','37619', '579-566-7996');
Insert Into person Values ('984', 'Wan  Power' ,'283 Lilac Lane', 'Center Valley','PA','37619', '357-354-7956');
Insert Into person Values ('167', 'Vina  Haver' ,'113 Chestnut Avenue', 'Center Valley','PA','37619', '336-368-8763');
Insert Into person Values ('693', 'Pilar  Pincus' ,'199 Center Street', 'Center Valley','PA','37619', '226-891-7562');
Insert Into person Values ('888', 'Leopoldo  Kafadar' ,'417 Jones Street', 'Center Valley','PA','37619', '794-816-2782');
Insert Into person Values ('957', 'Vanesa  Rodrigues' ,'333 6th Street West', 'Center Valley','PA','37619', '558-869-9353');
Insert Into person Values ('141', 'Agnus  Oneill' ,'724 Sheffield Drive', 'Center Valley','PA','37619', '138-851-9679');
Insert Into person Values ('657', 'Mellissa  Hood' ,'191 Eagle Street', 'Center Valley','PA','37619', '571-893-2176');
Insert Into person Values ('986', 'Rochelle  Daynard' ,'287 Willow Avenue', 'Center Valley','PA','37619', '663-645-8636');
Insert Into person Values ('155', 'Janee  Breyer' ,'824 King Street', 'Center Valley','PA','37619', '772-439-7979');
Insert Into person Values ('728', 'Carlyn  Steinitz' ,'891 Old York Road', 'Center Valley','PA','37619', '715-294-8774');
Insert Into person Values ('882', 'Harlan  Simon' ,'482 Maple Street', 'Center Valley','PA','37619', '321-569-9852');
Insert Into person Values ('614', 'Riva  Bergstrom' ,'118 Westminster Drive', 'Center Valley','PA','37619', '859-414-2941');
Insert Into person Values ('991', 'Curtis  Balkanski' ,'516 Jones Street', 'Center Valley','PA','37619', '373-291-9754');
Insert Into person Values ('757', 'Horacio  Koch-weser' ,'328 Lakeview Drive', 'Center Valley','PA','37619', '978-221-1722');
Insert Into person Values ('493', 'Werner  Frazee' ,'742 Route 10', 'Center Valley','PA','37619', '886-297-4165');
Insert Into person Values ('834', 'Lakeisha  Meier' ,'173 Front Street', 'Center Valley','PA','37619', '174-537-7336');
Insert Into person Values ('385', 'Trula  Meimand' ,'842 Main Street East', 'Center Valley','PA','37619', '577-277-7291');
Insert Into person Values ('641', 'Horacio  Delacey' ,'139 Bridge Street', 'Center Valley','PA','37619', '867-776-3129');
Insert Into person Values ('469', 'Leonard  Samoggia' ,'912 Monroe Drive', 'Center Valley','PA','37619', '425-624-8989');
Insert Into person Values ('281', 'Tressie  Grogger' ,'113 Deerfield Drive', 'Center Valley','PA','37619', '774-934-8593');
Insert Into person Values ('877', 'Cleo  Perko' ,'642 Central Avenue', 'Center Valley','PA','37619', '416-595-4577');
Insert Into person Values ('117', 'Stephine  Kalata' ,'324 Colonial Avenue', 'Center Valley','PA','37619', '248-814-4676');
Insert Into person Values ('915', 'Rick  Hanrieder' ,'773 Durham Road', 'Center Valley','PA','37619', '858-429-5938');
Insert Into person Values ('322', 'Denese  Simkovich' ,'514 Sycamore Lane', 'Center Valley','PA','37619', '534-558-1843');
Insert Into person Values ('656', 'Pauline  Hattersley' ,'773 Willow Drive', 'Center Valley','PA','37619', '554-852-5633');
Insert Into person Values ('166', 'Rosalie  Nercessian' ,'189 Cedar Street', 'Center Valley','PA','37619', '841-759-3973');
Insert Into person Values ('639', 'Alva  Haver' ,'487 Fairview Road', 'Center Valley','PA','37619', '325-773-7412');
Insert Into person Values ('928', 'Edwardo  Delacey' ,'947 Meadow Lane', 'Center Valley','PA','37619', '873-669-8778');
Insert Into person Values ('868', 'Shelly  Newsweek' ,'639 Elmwood Avenue', 'Center Valley','PA','37619', '386-327-7948');
Insert Into person Values ('743', 'Jammie  Kurihara' ,'129 Oak Avenue', 'Center Valley','PA','37619', '143-163-2547');
Insert Into person Values ('723', 'Edwardo  Chadbourne' ,'599 Glenwood Drive', 'Center Valley','PA','37619', '256-839-5851');
Insert Into person Values ('933', 'Inell  Nayduch' ,'451 5th Street North', 'Center Valley','PA','37619', '319-554-7156');
Insert Into person Values ('945', 'Jinny  Schinaia' ,'191 Front Street', 'Center Valley','PA','37619', '712-291-3671');
Insert Into person Values ('178', 'Leticia  Yanowitz' ,'562 Harrison Street', 'Center Valley','PA','37619', '575-241-7564');
Insert Into person Values ('633', 'Joaquin  Greenwood' ,'576 Ridge Avenue', 'Center Valley','PA','37619', '853-412-4443');
Insert Into person Values ('463', 'Tressie  Puggioni' ,'945 Maple Lane', 'Center Valley','PA','37619', '159-844-7547');
Insert Into person Values ('622', 'Lakeisha  Mendoza' ,'821 Windsor Drive', 'Center Valley','PA','37619', '576-795-6822');
Insert Into person Values ('746', 'Ellen  Chadbourne' ,'448 Hudson Street', 'Center Valley','PA','37619', '277-235-2756');
Insert Into person Values ('241', 'Sudie  Pitfield' ,'473 Bank Street', 'Center Valley','PA','37619', '335-622-5281');
Insert Into person Values ('997', 'Trina  Schreiner' ,'893 Windsor Drive', 'Center Valley','PA','37619', '644-786-1471');
Insert Into person Values ('934', 'Cherly  Thrainsson' ,'476 Old York Road', 'Center Valley','PA','37619', '252-882-4839');
Insert Into person Values ('381', 'Susanne  Piessens' ,'214 Circle Drive', 'Center Valley','PA','37619', '356-994-9565');
Insert Into person Values ('586', 'Tillie  Yong' ,'359 Cedar Avenue', 'Center Valley','PA','37619', '489-797-9997');
Insert Into person Values ('291', 'Donnell  Zorich' ,'613 Fawn Lane', 'Center Valley','PA','37619', '539-863-6521');
Insert Into person Values ('311', 'SheltonLafrance' ,'526 Cottage Street', 'Center Valley','PA','37619', '713-969-2287');
Insert Into person Values ('524', 'Cheryll  Rosania' ,'219 Primrose Lane', 'Center Valley','PA','37619', '894-827-7578');
Insert Into person Values ('856', 'Anastacia  Paul' ,'836 Laurel Street', 'Center Valley','PA','37619', '673-331-5272');
Insert Into person Values ('562', 'Lorinda  Schatz' ,'932 Westminster Drive', 'Center Valley','PA','37619', '118-538-3238');
Insert Into person Values ('955', 'Josphine  Gozzi' ,'949 Pleasant Street', 'Center Valley','PA','37619', '651-628-8451');
Insert Into person Values ('678', 'Sade  Pitfield' ,'453 Evergreen Lane', 'Center Valley','PA','37619', '472-167-1713');
Insert Into person Values ('327', 'Anastacia  Torelli' ,'856 6th Street', 'Center Valley','PA','37619', '623-455-6795');
Insert Into person Values ('431', 'Dorene  Hitchcock' ,'563 5th Avenue', 'Center Valley','PA','37619', '553-952-2179');
Insert Into person Values ('713', 'Tamica  Hoss' ,'499 Route 2', 'Center Valley','PA','37619', '925-643-6335');
Insert Into person Values ('941', 'Maire  Tuckerman' ,'189 Forest Avenue', 'Center Valley','PA','37619', '646-625-6252');
Insert Into person Values ('212', 'Raeann  Ingalls' ,'695 Elmwood Avenue', 'Center Valley','PA','37619', '169-973-2567');
Insert Into person Values ('799', 'Dale  Ge' ,'343 Mill Street', 'Center Valley','PA','37619', '714-561-1733');
Insert Into person Values ('729', 'Marty  Clifton' ,'681 Valley View Road', 'Center Valley','PA','37619', '876-559-7831');
Insert Into person Values ('978', 'Jarod  Stossel' ,'919 Orchard Street', 'Center Valley','PA','37619', '945-735-1369');
Insert Into person Values ('485', 'Gigi  Unamuno' ,'227 Madison Avenue', 'Center Valley','PA','37619', '315-694-1596');
Insert Into person Values ('751', 'Fransisca  Klint' ,'937 Heritage Drive', 'Center Valley','PA','37619', '667-865-8575');
Insert Into person Values ('173', 'Shawna  Uzuner' ,'851 Redwood Drive', 'Center Valley','PA','37619', '237-113-4634');
Insert Into person Values ('745', 'Fletcher  Castillo' ,'386 Garfield Avenue', 'Center Valley','PA','37619', '564-831-2221');
Insert Into person Values ('858', 'Raelene  Ge' ,'317 Lexington Court', 'Center Valley','PA','37619', '377-324-8914');
Insert Into person Values ('579', 'Tomas  Runnalls' ,'655 Church Street South', 'Center Valley','PA','37619', '257-666-7852');
Insert Into person Values ('951', 'Cecelia  Monaci' ,'124 Lawrence Street', 'Center Valley','PA','37619', '544-475-3257');
Insert Into person Values ('342', 'Tyisha  Schneiderman' ,'541 Queen Street', 'Center Valley','PA','37619', '319-983-4751');
Insert Into person Values ('838', 'Harlan  Pestana' ,'761 William Street', 'Center Valley','PA','37619', '692-434-2588');
Insert Into person Values ('859', 'Van  Frazee' ,'115 3rd Street East', 'Center Valley','PA','37619', '151-771-2484');
Insert Into person Values ('796', 'Vicenta  Marchi' ,'975 Cedar Avenue', 'Center Valley','PA','37619', '311-876-9823');
Insert Into person Values ('439', 'Lilly  Burdzy' ,'697 Buttonwood Drive', 'Center Valley','PA','37619', '934-587-3869');
Insert Into person Values ('266', 'Vanesa  Prosperi' ,'998 8th Street South', 'Center Valley','PA','37619', '122-516-6868');
Insert Into person Values ('232', 'Samual  Monaci' ,'689 3rd Street', 'Center Valley','PA','37619', '173-762-8594');
Insert Into person Values ('781', 'Jovan  Hood' ,'445 Valley Road', 'Center Valley','PA','37619', '614-216-3324');
Insert Into person Values ('353', 'Barton  Ousley' ,'381 Williams Street', 'Center Valley','PA','37619', '394-495-4268');
Insert Into person Values ('285', 'Mellissa  Hitchcock' ,'826 Surrey Lane', 'Center Valley','PA','37619', '211-957-4786');
Insert Into person Values ('765', 'Ellen  Kuntz' ,'321 B Street', 'Center Valley','PA','37619', '755-975-8339');
Insert Into person Values ('677', 'Charlyn  Runnalls' ,'984 Front Street', 'Center Valley','PA','37619', '718-814-6776');
Insert Into person Values ('441', 'Tia  Aldrich' ,'363 Canterbury Drive', 'Center Valley','PA','37619', '461-248-4622');
Insert Into person Values ('292', 'Yoshiko  Samoggia' ,'629 Grant Avenue', 'Center Valley','PA','37619', '118-637-7145');
Insert Into Employee Values ('431', '885');
Insert Into Employee Values ('536', '961');
Insert Into Employee Values ('158', '831');
Insert Into Employee Values ('292', '792');
Insert Into Employee Values ('673', '592');
Insert Into Employee Values ('921', '368');
Insert Into Employee Values ('615', '661');
Insert Into Employee Values ('217', '454');
Insert Into Employee Values ('963', '416');
Insert Into Employee Values ('562', '956');
Insert Into Employee Values ('182', '822');
Insert Into Employee Values ('878', '922');
Insert Into Employee Values ('995', '842');
Insert Into Employee Values ('465', '837');
Insert Into Employee Values ('854', '696');
Insert Into Employee Values ('851', '169');
Insert Into Patient Values ('453', '932');
Insert Into Patient Values ('764', '811');
Insert Into Patient Values ('923', '277');
Insert Into Patient Values ('469', '362');
Insert Into Patient Values ('444', '634');
Insert Into Patient Values ('763', '195');
Insert Into Patient Values ('782', '372');
Insert Into Patient Values ('548', '738');
Insert Into Patient Values ('656', '996');
Insert Into Patient Values ('275', '479');
Insert Into Patient Values ('587', '133');
Insert Into Patient Values ('211', '852');
Insert Into Patient Values ('386', '863');
Insert Into Patient Values ('251', '742');
Insert Into Patient Values ('294', '842');
Insert Into Patient Values ('758', '566');
Insert Into Patient Values ('794', '184');
Insert Into Patient Values ('477', '215');
Insert Into Patient Values ('989', '625');
Insert Into Patient Values ('987', '588');
Insert Into Patient Values ('658', '375');
Insert Into Patient Values ('227', '125');
Insert Into Patient Values ('966', '884');
Insert Into Patient Values ('979', '475');
Insert Into Patient Values ('342', '319');
Insert Into Patient Values ('582', '182');
Insert Into Patient Values ('343', '111');
Insert Into Patient Values ('147', '377');
Insert Into Patient Values ('546', '339');
Insert Into Patient Values ('181', '535');
Insert Into Patient Values ('483', '575');
Insert Into Patient Values ('367', '817');
Insert Into Patient Values ('757', '967');
Insert Into Patient Values ('493', '467');
Insert Into Patient Values ('231', '853');
Insert Into Patient Values ('881', '829');
Insert Into Patient Values ('532', '954');
Insert Into Patient Values ('172', '494');
Insert Into Patient Values ('751', '142');
Insert Into Patient Values ('443', '767');
Insert Into Patient Values ('899', '896');
Insert Into Patient Values ('589', '984');
Insert Into Patient Values ('647', '111');
Insert Into Patient Values ('138', '167');
Insert Into Patient Values ('862', '693');
Insert Into Patient Values ('759', '888');
Insert Into Patient Values ('693', '957');
Insert Into Patient Values ('243', '141');
Insert Into Patient Values ('675', '657');
Insert Into Patient Values ('865', '986');
Insert Into Patient Values ('486', '155');
Insert Into Patient Values ('958', '728');
Insert Into Patient Values ('799', '882');
Insert Into Patient Values ('126', '614');
Insert Into Patient Values ('695', '991');
Insert Into Patient Values ('435', '757');
Insert Into Patient Values ('722', '493');
Insert Into Patient Values ('519', '834');
Insert Into Patient Values ('785', '385');
Insert Into Patient Values ('798', '641');
Insert Into Patient Values ('685', '469');
Insert Into Patient Values ('988', '996');
Insert Into Patient Values ('937', '877');
Insert Into Patient Values ('639', '117');
Insert Into Patient Values ('765', '915');
Insert Into Patient Values ('199', '322');
Insert Into Patient Values ('522', '656');
Insert Into Patient Values ('377', '915');
Insert Into Patient Values ('194', '863');
Insert Into Patient Values ('684', '166');
Insert Into Patient Values ('967', '639');
Insert Into Patient Values ('348', '928');
Insert Into Patient Values ('353', '868');
Insert Into Patient Values ('672', '743');
Insert Into Patient Values ('319', '933');
Insert Into Patient Values ('315', '945');
Insert Into Patient Values ('871', '178');
Insert Into Patient Values ('176', '868');
Insert Into Patient Values ('617', '633');
Insert Into Patient Values ('174', '463');
Insert Into Patient Values ('516', '622');
Insert Into Patient Values ('662', '746');
Insert Into Patient Values ('513', '997');
Insert Into Patient Values ('775', '934');
Insert Into Patient Values ('641', '381');
Insert Into Patient Values ('149', '586');
Insert Into Patient Values ('333', '291');
Insert Into Patient Values ('324', '291');
Insert Into Patient Values ('681', '311');
Insert Into Patient Values ('651', '885');
Insert Into Patient Values ('938', '562');
Insert Into Patient Values ('635', '955');
Insert Into Patient Values ('597', '678');
Insert Into Patient Values ('951', '327');
Insert Into Patient Values ('876', '322');
Insert Into Patient Values ('626', '713');
Insert Into Patient Values ('999', '941');
Insert Into Patient Values ('667', '829');
Insert Into Patient Values ('446', '212');
Insert Into Patient Values ('117', '799');
Insert Into Patient Values ('648', '729');
Insert Into Patient Values ('811', '978');
Insert Into Patient Values ('264', '485');
Insert Into Patient Values ('723', '751');
Insert Into Patient Values ('197', '562');
Insert Into Patient Values ('953', '173');
Insert Into Patient Values ('549', '745');
Insert Into Patient Values ('655', '858');
Insert Into Patient Values ('851', '579');
Insert Into Patient Values ('592', '951');
Insert Into Patient Values ('885', '342');
Insert Into Patient Values ('387', '838');
Insert Into Patient Values ('784', '796');
Insert Into Patient Values ('653', '439');
Insert Into Patient Values ('644', '633');
Insert Into Patient Values ('551', '266');
Insert Into Patient Values ('615', '232');
Insert Into Patient Values ('388', '781');
Insert Into Patient Values ('196', '353');
Insert Into Patient Values ('761', '285');
Insert Into Patient Values ('494', '765');
Insert Into Patient Values ('178', '677');
Insert Into Patient Values ('992', '441');
Insert Into Patient Values ('132', '292');
Insert Into Nurse_practitioner Values ('381', '431');
Insert Into Nurse_practitioner Values ('681', '536');
Insert Into Registered_Nurse Values ('548', '158');
Insert Into Registered_Nurse Values ('923', '292');
Insert Into Pharmacist Values ('468', '673');
Insert Into Pharmacist Values ('979', '921');
Insert Into Midwives Values ('222', '615');
Insert Into Midwives Values ('295', '217');
Insert Into Physician Values ('369', '963','Physician');
Insert Into Physician Values ('799', '562','Surgeon');
Insert Into Physician Values ('918', '182','Pediatrician');
Insert Into Physician Values ('585', '878','Physician');
Insert Into Physician Values ('253', '995','Physician');
Insert Into Office_Admin Values ('125', '465');
Insert Into Receptionist Values ('936', '854');
Insert Into Book_Keeper Values ('465', '851');
Insert Into healthcare Values('1','Governmental','453');
Insert Into healthcare Values('2','Private','764');
Insert Into healthcare Values('3','Private','923');
Insert Into healthcare Values('4','Private','469');
Insert Into healthcare Values('5','None','444');
Insert Into healthcare Values('6','Private','763');
Insert Into healthcare Values('7','None','782');
Insert Into healthcare Values('8','Private','548');
Insert Into healthcare Values('9','Private','656');
Insert Into healthcare Values('10','Private','275');
Insert Into healthcare Values('11','None','587');
Insert Into healthcare Values('12','None','211');
Insert Into healthcare Values('13','None','386');
Insert Into healthcare Values('14','None','251');
Insert Into healthcare Values('15','None','294');
Insert Into healthcare Values('16','None','758');
Insert Into healthcare Values('17','None','794');
Insert Into healthcare Values('18','Governmental','477');
Insert Into healthcare Values('19','Governmental','989');
Insert Into healthcare Values('20','None','987');
Insert Into healthcare Values('21','Governmental','658');
Insert Into healthcare Values('22','None','227');
Insert Into healthcare Values('23','None','966');
Insert Into healthcare Values('24','None','979');
Insert Into healthcare Values('25','None','342');
Insert Into healthcare Values('26','None','582');
Insert Into healthcare Values('27','Governmental','343');
Insert Into healthcare Values('28','Private','147');
Insert Into healthcare Values('29','Private','546');
Insert Into healthcare Values('30','Governmental','582');
Insert Into healthcare Values('31','Governmental','181');
Insert Into healthcare Values('32','None','483');
Insert Into healthcare Values('33','Private','367');
Insert Into healthcare Values('34','Governmental','757');
Insert Into healthcare Values('35','None','493');
Insert Into healthcare Values('36','Governmental','231');
Insert Into healthcare Values('37','Governmental','881');
Insert Into healthcare Values('38','None','532');
Insert Into healthcare Values('39','Governmental','172');
Insert Into healthcare Values('40','None','751');
Insert Into healthcare Values('41','Private','443');
Insert Into healthcare Values('42','Private','899');
Insert Into healthcare Values('43','None','589');
Insert Into healthcare Values('44','None','647');
Insert Into healthcare Values('45','Private','138');
Insert Into healthcare Values('46','Governmental','862');
Insert Into healthcare Values('47','None','211');
Insert Into healthcare Values('48','None','759');
Insert Into healthcare Values('49','None','693');
Insert Into healthcare Values('50','None','243');
Insert Into healthcare Values('51','None','675');
Insert Into healthcare Values('52','None','865');
Insert Into healthcare Values('53','None','486');
Insert Into healthcare Values('54','None','958');
Insert Into healthcare Values('55','None','799');
Insert Into healthcare Values('56','None','126');
Insert Into healthcare Values('57','Private','695');
Insert Into healthcare Values('58','Private','435');
Insert Into healthcare Values('59','Private','722');
Insert Into healthcare Values('60','Private','519');
Insert Into healthcare Values('61','Governmental','785');
Insert Into healthcare Values('62','Governmental','798');
Insert Into healthcare Values('63','None','685');
Insert Into healthcare Values('64','None','987');
Insert Into healthcare Values('65','Governmental','988');
Insert Into healthcare Values('66','Governmental','937');
Insert Into healthcare Values('67','Governmental','639');
Insert Into healthcare Values('68','Governmental','765');
Insert Into healthcare Values('69','None','199');
Insert Into healthcare Values('70','None','522');
Insert Into healthcare Values('71','None','443');
Insert Into healthcare Values('72','Governmental','377');
Insert Into healthcare Values('73','None','194');
Insert Into healthcare Values('74','None','684');
Insert Into healthcare Values('75','None','967');
Insert Into healthcare Values('76','None','348');
Insert Into healthcare Values('77','None','353');
Insert Into healthcare Values('78','Private','672');
Insert Into healthcare Values('79','None','658');
Insert Into healthcare Values('80','None','319');
Insert Into healthcare Values('81','Private','315');
Insert Into healthcare Values('82','Governmental','871');
Insert Into healthcare Values('83','Private','176');
Insert Into healthcare Values('84','None','617');
Insert Into healthcare Values('85','Governmental','174');
Insert Into healthcare Values('86','None','516');
Insert Into healthcare Values('87','None','662');
Insert Into healthcare Values('88','Private','617');
Insert Into healthcare Values('89','Governmental','513');
Insert Into healthcare Values('90','Governmental','775');
Insert Into healthcare Values('91','None','641');
Insert Into healthcare Values('92','None','149');
Insert Into healthcare Values('93','Governmental','333');
Insert Into healthcare Values('94','Governmental','324');
Insert Into healthcare Values('95','None','681');
Insert Into healthcare Values('96','Governmental','937');
Insert Into healthcare Values('97','Governmental','923');
Insert Into healthcare Values('98','Governmental','651');
Insert Into healthcare Values('99','Private','938');
Insert Into healthcare Values('100','None','635');
Insert Into healthcare Values('101','None','597');
Insert Into healthcare Values('102','None','951');
Insert Into healthcare Values('103','None','876');
Insert Into healthcare Values('104','Governmental','979');
Insert Into healthcare Values('105','None','626');
Insert Into healthcare Values('106','None','999');
Insert Into healthcare Values('107','None','667');
Insert Into healthcare Values('108','None','446');
Insert Into healthcare Values('109','Private','117');
Insert Into healthcare Values('110','None','648');
Insert Into healthcare Values('111','Private','811');
Insert Into healthcare Values('112','Private','264');
Insert Into healthcare Values('113','Governmental','723');
Insert Into healthcare Values('114','None','197');
Insert Into healthcare Values('115','None','953');
Insert Into healthcare Values('116','None','549');
Insert Into healthcare Values('117','None','655');
Insert Into healthcare Values('118','Private','851');
Insert Into healthcare Values('119','Governmental','592');
Insert Into healthcare Values('120','None','885');
Insert Into healthcare Values('121','None','387');
Insert Into healthcare Values('122','None','231');
Insert Into healthcare Values('123','None','784');
Insert Into healthcare Values('124','None','653');
Insert Into healthcare Values('125','None','644');
Insert Into healthcare Values('126','None','551');
Insert Into healthcare Values('127','None','615');
Insert Into healthcare Values('128','None','388');
Insert Into healthcare Values('129','Private','196');
Insert Into healthcare Values('130','Private','761');
Insert Into healthcare Values('131','Private','494');
Insert Into healthcare Values('132','Governmental','178');
Insert Into healthcare Values('133','Private','992');
Insert Into healthcare Values('134','Private','132');
Insert Into Test Values('0','Diabetes risk tests','Bad','979');
Insert Into Test Values('1','C-reactive protein test','Bad','446');
Insert Into Test Values('2','Stress test','Bad','227');
Insert Into Test Values('3','Pap smear','Bad','758');
Insert Into Test Values('4','Lipid profile','Good','648');
Insert Into Test Values('5','Colonoscopy','Bad','862');
Insert Into Test Values('6','Pap smear','Bad','992');
Insert Into Test Values('7','Colonoscopy','Good','899');
Insert Into Test Values('8','CYP450 test','Good','798');
Insert Into Test Values('9','Stress test','Bad','999');
Insert Into Test Values('10','Colonoscopy','Good','486');
Insert Into Test Values('11','Diabetes risk tests','Bad','172');
Insert Into Test Values('12','Colonoscopy','Good','758');
Insert Into Test Values('13','C-reactive protein test','Good','937');
Insert Into Test Values('14','C-reactive protein test','Bad','979');
Insert Into Test Values('15','Stress test','Good','516');
Insert Into Test Values('16','Skin cancer exam','Good','589');
Insert Into Test Values('17','Stress test','Good','522');
Insert Into Test Values('18','Diabetes risk tests','Bad','644');
Insert Into Test Values('19','Lipid profile','Good','582');
Insert Into prescription Values('1','Tablet',88,to_date('1/1/2004', 'MM/DD/YYYY'),to_date('4/1/2006', 'MM/DD/YYYY'),'723');
Insert Into prescription Values('2','Inhalers',49,to_date('5/5/2014', 'MM/DD/YYYY'),to_date('1/7/2010', 'MM/DD/YYYY'),'651');
Insert Into prescription Values('3','Drops',116,to_date('6/20/2014', 'MM/DD/YYYY'),to_date('2/19/2010', 'MM/DD/YYYY'),'751');
Insert Into prescription Values('4','Suppositories',144,to_date('1/28/2002', 'MM/DD/YYYY'),to_date('7/19/2015', 'MM/DD/YYYY'),'516');
Insert Into prescription Values('5','Tablet',11,to_date('11/18/2004', 'MM/DD/YYYY'),to_date('10/14/2014', 'MM/DD/YYYY'),'647');
Insert Into prescription Values('6','Drops',66,to_date('4/6/2016', 'MM/DD/YYYY'),to_date('2/28/2009', 'MM/DD/YYYY'),'651');
Insert Into prescription Values('7','Inhalers',32,to_date('9/3/2007', 'MM/DD/YYYY'),to_date('8/26/2003', 'MM/DD/YYYY'),'264');
Insert Into prescription Values('8','Inhalers',92,to_date('12/13/2010', 'MM/DD/YYYY'),to_date('9/3/2015', 'MM/DD/YYYY'),'966');
Insert Into prescription Values('9','Liquid',192,to_date('11/6/2006', 'MM/DD/YYYY'),to_date('4/15/2015', 'MM/DD/YYYY'),'987');
Insert Into prescription Values('10','Injections',140,to_date('3/17/2005', 'MM/DD/YYYY'),to_date('4/9/2003', 'MM/DD/YYYY'),'782');
Insert Into prescription Values('11','Injections',180,to_date('5/10/2002', 'MM/DD/YYYY'),to_date('3/28/2003', 'MM/DD/YYYY'),'348');
Insert Into prescription Values('12','Liquid',4,to_date('4/14/2014', 'MM/DD/YYYY'),to_date('2/18/2006', 'MM/DD/YYYY'),'881');
Insert Into prescription Values('13','Inhalers',30,to_date('5/20/2017', 'MM/DD/YYYY'),to_date('6/29/2007', 'MM/DD/YYYY'),'987');
Insert Into prescription Values('14','Inhalers',2,to_date('11/3/2001', 'MM/DD/YYYY'),to_date('7/21/2009', 'MM/DD/YYYY'),'348');
Insert Into prescription Values('15','Liquid',45,to_date('1/9/2006', 'MM/DD/YYYY'),to_date('1/2/2009', 'MM/DD/YYYY'),'862');
Insert Into prescription Values('16','Tablet',171,to_date('10/30/2012', 'MM/DD/YYYY'),to_date('9/5/2009', 'MM/DD/YYYY'),'722');
Insert Into prescription Values('17','Liquid',43,to_date('1/3/2005', 'MM/DD/YYYY'),to_date('1/9/2009', 'MM/DD/YYYY'),'486');
Insert Into prescription Values('18','Capsules',94,to_date('9/4/2017', 'MM/DD/YYYY'),to_date('11/27/2007', 'MM/DD/YYYY'),'343');
Insert Into prescription Values('19','Capsules',50,to_date('4/16/2014', 'MM/DD/YYYY'),to_date('7/28/2008', 'MM/DD/YYYY'),'871');
Insert Into prescription Values('20','Drops',100,to_date('5/22/2004', 'MM/DD/YYYY'),to_date('12/1/2015', 'MM/DD/YYYY'),'444');
Insert Into prescription Values('21','Liquid',52,to_date('6/29/2006', 'MM/DD/YYYY'),to_date('6/28/2000', 'MM/DD/YYYY'),'647');
Insert Into prescription Values('22','Tablet',173,to_date('2/22/2009', 'MM/DD/YYYY'),to_date('6/18/2011', 'MM/DD/YYYY'),'685');
Insert Into prescription Values('23','Capsules',192,to_date('7/10/2014', 'MM/DD/YYYY'),to_date('2/14/2010', 'MM/DD/YYYY'),'782');
Insert Into prescription Values('24','Liquid',71,to_date('11/15/2016', 'MM/DD/YYYY'),to_date('10/6/2007', 'MM/DD/YYYY'),'275');
Insert Into prescription Values('25','Suppositories',55,to_date('1/7/2007', 'MM/DD/YYYY'),to_date('2/6/2000', 'MM/DD/YYYY'),'353');
Insert Into prescription Values('26','Liquid',196,to_date('11/21/2014', 'MM/DD/YYYY'),to_date('4/22/2014', 'MM/DD/YYYY'),'227');
Insert Into prescription Values('27','Capsules',138,to_date('7/30/2014', 'MM/DD/YYYY'),to_date('9/14/2000', 'MM/DD/YYYY'),'785');
Insert Into prescription Values('28','Injections',84,to_date('11/19/2004', 'MM/DD/YYYY'),to_date('3/26/2003', 'MM/DD/YYYY'),'685');
Insert Into prescription Values('29','Capsules',63,to_date('10/21/2013', 'MM/DD/YYYY'),to_date('8/22/2007', 'MM/DD/YYYY'),'667');
Insert Into prescription Values('30','Tablet',92,to_date('7/29/2001', 'MM/DD/YYYY'),to_date('6/21/2005', 'MM/DD/YYYY'),'315');
Insert Into visit Values('1',to_date('11/29/2016', 'MM/DD/YYYY'),'walkin','194');
Insert Into visit Values('2',to_date('8/18/2000', 'MM/DD/YYYY'),'walkin','199');
Insert Into visit Values('3',to_date('4/20/2013', 'MM/DD/YYYY'),'scheduled appointment','899');
Insert Into visit Values('4',to_date('10/24/2014', 'MM/DD/YYYY'),'walkin','937');
Insert Into visit Values('5',to_date('7/29/2002', 'MM/DD/YYYY'),'scheduled appointment','513');
Insert Into visit Values('6',to_date('3/12/2012', 'MM/DD/YYYY'),'walkin','784');
Insert Into visit Values('7',to_date('1/25/2007', 'MM/DD/YYYY'),'scheduled appointment','483');
Insert Into visit Values('8',to_date('11/18/2006', 'MM/DD/YYYY'),'walkin','227');
Insert Into visit Values('9',to_date('10/2/2010', 'MM/DD/YYYY'),'walkin','377');
Insert Into visit Values('10',to_date('8/11/2009', 'MM/DD/YYYY'),'walkin','722');
Insert Into visit Values('11',to_date('3/10/2014', 'MM/DD/YYYY'),'scheduled appointment','227');
Insert Into visit Values('12',to_date('11/14/2006', 'MM/DD/YYYY'),'scheduled appointment','615');
Insert Into visit Values('13',to_date('11/23/2009', 'MM/DD/YYYY'),'scheduled appointment','641');
Insert Into visit Values('14',to_date('10/3/2005', 'MM/DD/YYYY'),'scheduled appointment','923');
Insert Into visit Values('15',to_date('1/17/2001', 'MM/DD/YYYY'),'walkin','589');
Insert Into visit Values('16',to_date('3/23/2006', 'MM/DD/YYYY'),'scheduled appointment','546');
Insert Into visit Values('17',to_date('12/10/2004', 'MM/DD/YYYY'),'walkin','695');
Insert Into visit Values('18',to_date('3/30/2014', 'MM/DD/YYYY'),'walkin','172');
Insert Into visit Values('19',to_date('4/25/2008', 'MM/DD/YYYY'),'scheduled appointment','353');
Insert Into visit Values('20',to_date('8/17/2009', 'MM/DD/YYYY'),'walkin','876');
Insert Into visit Values('21',to_date('6/2/2013', 'MM/DD/YYYY'),'scheduled appointment','785');
Insert Into visit Values('22',to_date('9/17/2012', 'MM/DD/YYYY'),'scheduled appointment','757');
Insert Into visit Values('23',to_date('6/14/2008', 'MM/DD/YYYY'),'walkin','987');
Insert Into visit Values('24',to_date('3/19/2008', 'MM/DD/YYYY'),'scheduled appointment','775');
Insert Into visit Values('25',to_date('1/30/2006', 'MM/DD/YYYY'),'scheduled appointment','178');
Insert Into visit Values('26',to_date('8/11/2000', 'MM/DD/YYYY'),'walkin','522');
Insert Into visit Values('27',to_date('8/8/2012', 'MM/DD/YYYY'),'scheduled appointment','443');
Insert Into visit Values('28',to_date('11/9/2000', 'MM/DD/YYYY'),'walkin','651');
Insert Into visit Values('29',to_date('2/28/2011', 'MM/DD/YYYY'),'walkin','243');
Insert Into visit Values('30',to_date('10/23/2015', 'MM/DD/YYYY'),'walkin','794');
Insert Into sample Values('1','Urine','667');
Insert Into sample Values('2','Blood','589');
Insert Into sample Values('3','Blood','181');
Insert Into sample Values('4','Urine','923');
Insert Into sample Values('5','Blood','483');
Insert Into sample Values('6','Urine','342');
Insert Into sample Values('7','Urine','348');
Insert Into sample Values('8','Blood','194');
Insert Into sample Values('9','Urine','516');
Insert Into sample Values('10','Skin','178');
Insert Into sample Values('11','Urine','275');
Insert Into sample Values('12','Urine','862');
Insert Into sample Values('13','Blood','319');
Insert Into sample Values('14','Blood','199');
Insert Into sample Values('15','Blood','243');
Insert Into sample Values('16','Urine','881');
Insert Into sample Values('17','Urine','181');
Insert Into sample Values('18','Blood','132');
Insert Into sample Values('19','Skin','592');
Insert Into sample Values('20','Blood','684');
Insert Into sample Values('21','Skin','862');
Insert Into sample Values('22','Urine','992');
Insert Into sample Values('23','Skin','315');
Insert Into sample Values('24','Blood','651');
Insert Into sample Values('25','Urine','871');
Insert Into sample Values('26','Blood','979');
Insert Into sample Values('27','Urine','315');
Insert Into sample Values('28','Urine','178');
Insert Into sample Values('29','Skin','275');
Insert Into sample Values('30','Skin','367');
Insert Into bill Values('1',152.84,'759');
Insert Into bill Values('2',162.89,'876');
Insert Into bill Values('3',153.02,'587');
Insert Into bill Values('4',182.02,'343');
Insert Into bill Values('5',174.95,'582');
Insert Into bill Values('6',129.00,'885');
Insert Into bill Values('7',163.54,'635');
Insert Into bill Values('8',25.97,'641');
Insert Into bill Values('9',168.57,'763');
Insert Into bill Values('10',86.58,'953');
Insert Into bill Values('11',15.69,'522');
Insert Into bill Values('12',48.45,'194');
Insert Into bill Values('13',48.54,'667');
Insert Into bill Values('14',15.56,'757');
Insert Into bill Values('15',114.54,'294');
Insert Into bill Values('16',87.49,'988');
Insert Into bill Values('17',176.71,'782');
Insert Into bill Values('18',29.44,'987');
Insert Into bill Values('19',44.18,'871');
Insert Into bill Values('20',76.53,'784');
Insert Into bill Values('21',192.82,'444');
Insert Into bill Values('22',109.22,'377');
Insert Into bill Values('23',19.06,'655');
Insert Into bill Values('24',10.11,'551');
Insert Into bill Values('25',199.51,'333');
Insert Into bill Values('26',146.75,'784');
Insert Into bill Values('27',123.35,'388');
Insert Into bill Values('28',14.81,'798');
Insert Into bill Values('29',30.46,'227');
Insert Into bill Values('30',81.85,'937');