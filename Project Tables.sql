--drop
Drop Table  Person 			CASCADE CONSTRAINTS;
Drop Table  Employee 		CASCADE CONSTRAINTS;
--create table
Create Table Person{
	Person_ID	varchar2(20),
	Name		varchar2(30),
	Street		varchar2(30),
	PhoneNum	varchar2(30),
	
	Constraint Person_pk Primary Key (Person_ID)
};

Create Table Employee(
	Emp_ID		varchar2(20),
	Constraint Employee_pk Primary Key (Employee_ID)
);

Create Table Nurse_practitioner(
	NP_ID		varchar2(20),
	Constraint Nurse_practitioner_pk Primary Key (NP_ID)
);

Create Table Registered_Nurses(
	RN_ID		varchar2(20),
	Constraint Registered_Nurses_pk Primary Key (RN_ID)
);

Create Table Pharmacist(
	Pharmacist_ID		varchar2(20),
	Constraint Pharmacist_pk Primary Key (RN_ID)
);

Create Table Medical_Technician(
	MT_ID				varchar2(20),
	Constraint Medical_Technician_pk Primary Key (MT_ID)
);

Create Table Physician(
	Physician_ID				varchar2(20),
	Constraint Physician_pk Primary Key (Physician_ID)
);

