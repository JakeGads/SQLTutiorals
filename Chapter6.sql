--drops all tables
Drop Table Student 			CASCADE CONSTANT;
Drop Table Faculty 			CASCADE CONSTANT;
Drop Table Course 			CASCADE CONSTANT;
Drop Table Qualifed 		CASCADE CONSTANT;
Drop Table Sections 		CASCADE CONSTANT;
Drop Table Registration 	CASCADE CONSTANT;

--creates the tables
--#1
Create Table Student(
	Student_ID		Number(),
	Student_Name	varchar2(25),

	Constraint student_pk Primary Key (Student_ID)
);

Create Table Faculty(
	Faculty_ID		Number(),
	Faculty_Name	varchar2(25),

	Constraint faculty_pk Primary Key (Faculty_ID)
);

Create Table Course(
	Course_ID		varchar2(8),
	Course_Name		varchar2(15),

	Constraint course_pk Primary Key (Course_ID)
);

Create Table Qualifed(
	Faculty_ID		Number(5),
	Course_ID		varchar2(10),
	DateQualified	Date(),
	
	Constraint Qualifed_pk 	Primary Key (Faculty_ID,Course_ID),
	Constraint Course_fk 	Foreign Key (Course_ID) 	REFERENCES Course(Course_ID),
	Constraint Faculty_fk 	Foreign Key (Faculty_ID) 	REFERENCES Faculty(Faculty_ID)
);

Create Table Sections(
	Section_No		Number(),
	Semester		varchar2(10),
	Course_ID		varchar2(10)	Not Null, --3
	
	Constraint Sections_pk 	Primary Key (Sections_No,Semester, Course_ID),
	Constraint Course_fk 	Foreign Key (Course_ID) 	REFERENCES Course(Course_ID)
);

Create Table Registration(
	Student_ID		Number(),
	Section_No		varchar2(10),
	Semester		varchar2(10),
	
	Constraint Registration_pk 	Primary Key (Student_ID,Section_No, Semester),
	Constraint Student_fk		Foreign Key (Student_ID) 	REFERENCES Student(Student_ID),
	Constraint Section_fk		Foreign Key (Section_No) 	REFERENCES Sections(Section_No),
	Constraint Semester_fk		Foreign Key (Semester) 		REFERENCES Sections(Semester)
);


--populates the tables
--#2
/*
Insert Into Student
Values (38214, 'Letersky');

Insert Into Student
Values (54907, 'Alvater');

Insert Into Student
Values (54907, 'Alvater');

Insert Into Student
Values (66324, 'Aiken');

Insert Into Faculty
Values(2143, 'Birkin');

Insert Into Faculty
Values(3467, 'Berndt');

Insert Into Faculty
Values(4756, 'Colins');

Insert Into Course
Values('ISM 3113', 'Syst Analysis');

Insert Into Course
Values('ISM 3112', 'Syst Design');

Insert Into Course
Values('ISM 4212', 'Databases');

Insert Into Course
Values('ISM 4930', 'Networking');
*/
Insert Into Student	Values 
(38214, 'Letersky'),
(54907, 'Alvater'),
(54907, 'Alvater'),
(66324, 'Aiken');

Insert Into Faculty Values
(2143, 'Birkin'),
(3467, 'Berndt'),
(4756, 'Colins');

Insert Into Course Values
('ISM 3113', 'Syst Analysis'),
('ISM 3112', 'Syst Design'),
('ISM 4212', 'Databases'),
('ISM 4930', 'Networking');

--4
--a
Alter Table Student
Add Class_ varchar2(20);

--b
Drop Table Registration 	CASCADE CONSTANT;

--c
Alter Table Falculty
Update Faculty_Name	varchar2(40)
 
