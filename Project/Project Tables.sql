--drop
Drop Table  Person 			    CASCADE CONSTRAINTS;
Drop Table  Employee 		    CASCADE CONSTRAINTS;
Drop Table  Nurse_Practitioner  CASCADE CONSTRAINTS;
Drop Table  Registered_Nurse    CASCADE CONSTRAINTS;
Drop Table  Pharmacist          CASCADE CONSTRAINTS;
Drop Table  Medical_Technician  CASCADE CONSTRAINTS;
Drop Table  Physician           CASCADE CONSTRAINTS;
Drop Table  Office_Admin        CASCADE CONSTRAINTS;
Drop Table  Receptionist        CASCADE CONSTRAINTS;
Drop Table  Book_Keeper         CASCADE CONSTRAINTS;
Drop Table  Bill                CASCADE CONSTRAINTS;
Drop Table  Room                CASCADE CONSTRAINTS;

--create table
Create Table Person(
	Person_ID	varchar2(20),
	Name		varchar2(30),
	Street		varchar2(30),
	PhoneNum	varchar2(30),
	
	Constraint Person_pk Primary Key (Person_ID)
);

Create Table Employee(
	Employee_ID		varchar2(20),
	Constraint Employee_pk Primary Key (Employee_ID)
);

Create Table Nurse_practitioner(
	NP_ID		varchar2(20),
	Constraint Nurse_practitioner_pk Primary Key (NP_ID)
);

Create Table Registered_Nurse(
	Registered_Nurse_ID		varchar2(20),
	Constraint Registered_Nurse_pk Primary Key (Registered_Nurse_ID)
);

Create Table Pharmacist(
	Pharmacist_ID		varchar2(20),
	Constraint Pharmacist_pk Primary Key (Pharmacist_ID)
);

Create Table Medical_Technician(
	MT_ID				varchar2(20),
	Constraint Medical_Technician_pk Primary Key (MT_ID)
);

Create Table Physician(
	Physician_ID		varchar2(20),
    Speciality          varchar2(20),
    
    Constraint Speciality_Check check (speciality = 'Physician' or speciality = 'Surgeon' or speciality = 'Pediatrician'),
	Constraint Physician_pk Primary Key (Physician_ID)
);

Create Table Office_Admin(
    OA_ID               varchar2(20),
    Constraint Office_Admin_pk Primary Key (OA_ID)
);

Create Table Receptionist(
    R_ID                varchar2(20),
    Constraint Receptionist_pk Primary Key (R_ID)
);

Create Table Book_Keeper(
    BK_ID               varchar2(20),
    Constraint BookKeeper Primary Key (BK_ID)
);

Create Table Bill(
    Bill_ID     varchar2(20),
    Bill_Price  number,
    
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