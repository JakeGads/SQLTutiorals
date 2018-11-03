--drops all tables
Drop Table Student 			CASCADE CONSTANT
Drop Table Faculty 			CASCADE CONSTANT
Drop Table Course 			CASCADE CONSTANT
Drop Table Qualifed 		CASCADE CONSTANT
Drop Table Sections 		CASCADE CONSTANT
Drop Table Registration 	CASCADE CONSTANT

--creates the tables
Create Table Student(
	Student_ID		integer(),
	Student_Name	varchar2(25),

	Constraint student_pk Primary Key (Student_ID)
);

Create Table Faculty(
	Faculty_ID		integer(),
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
	
	Constraint Qualifed_pk Primary Key (Faculty_ID,Course_ID),
	Foreign Key (Course_ID) REFERENCES Course(Course_ID),
	Foreign Key (Faculty_ID) REFERENCES Faculty(Faculty_ID)
);

Create Table Sections(
	Section_No		integer(),
	Semester		varchar2(10),
	Course_ID		varchar2(10),
	
	Constraint Sections_pk Primary Key (Sections_No,Semester, Course_ID),
	Foreign Key (Course_ID) REFERENCES Course(Course_ID)
);

Create Table Registration(
	Student_ID		integer(),
	Section_No		varchar2(10),
	Semester		varchar2(10),
	
	Constraint Registration_pk Primary Key (Student_ID,Section_No, Semester),
	Foreign Key (Student_ID) REFERENCES Student(Student_ID),
	Foreign Key (Section_No) REFERENCES Sections(Section_No),
	Foreign Key (Semester) REFERENCES Sections(Semester)
);


--populates the tables
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
Values('ISM 3113', 'Syst Analysis')

Insert Into Course
Values('ISM 3112', 'Syst Design')

Insert Into Course
Values('ISM 4212', 'Databases')

Insert Into Course
Values('ISM 4930', 'Networking')