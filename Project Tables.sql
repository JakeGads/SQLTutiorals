--drop

--create table
Create Table Person{
	Person_ID	varchar2(20),
	Name		varchar2(30),
	Street		varchar2(30),
	PhoneNum	varchar2(30),
	
	Constraint Person_pk Primary Key (Person_ID)
};

Create Table Employee(
	Emp_ID		varchar2(30),
	Constraint Employee_pk Primary Key (Employee_ID)
);