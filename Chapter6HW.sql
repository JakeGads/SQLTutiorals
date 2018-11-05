    --drops all tables
    Drop Table Student 			CASCADE CONSTRAINTS;
    Drop Table Faculty 			CASCADE CONSTRAINTS;
    Drop Table Course 			CASCADE CONSTRAINTS;
    Drop Table Qualifed 		CASCADE CONSTRAINTS;
    Drop Table Sections 		CASCADE CONSTRAINTS;
    Drop Table Registration 	CASCADE CONSTRAINTS;
    
    --creates the tables
    --#1
    Create Table Student(
        Student_ID		Integer   Not Null,
        Student_Name	varchar2(25),
    
        Constraint student_pk Primary Key (Student_ID)
    );
    
    Create Table Faculty(
        Faculty_ID		Integer   Not Null,
        Faculty_Name	varchar2(25),
    
        Constraint faculty_pk Primary Key (Faculty_ID)
    );
    
    Create Table Course(
        Course_ID		varchar2(8) Not Null,
        Course_Name		varchar2(15),
    
        Constraint course_pk Primary Key (Course_ID)
    );
    
    Create Table Qualifed(
        Faculty_ID		Integer,
        Course_ID		varchar2(10),
        DateQualified	Date,
        
        Constraint Qualifed_pk 	Primary Key (Faculty_ID,Course_ID),
        Constraint Qualifed_fk 	Foreign Key (Course_ID) 	REFERENCES Course(Course_ID),
        Constraint Qualifed1_fk 	Foreign Key (Faculty_ID) 	REFERENCES Faculty(Faculty_ID)
    );
    
    Create Table Sections(
        Sections_No		Integer       Not Null,
        Semester		varchar2(10)    Not Null,
        Course_ID		varchar2(10)	Not Null, --3
        
        Constraint Sections_pk 	Primary Key (Sections_No),
        Constraint Sections_fk 	Foreign Key (Course_ID) 	REFERENCES Course(Course_ID)
    );
    
    Create Table Registration(
        Student_ID		Integer,
        Sections_No		Integer,
        Semester		varchar2(10),
        
        Constraint Registration_pk 	    Primary Key (Student_ID, Sections_No),
        
        Constraint Registration_fk		Foreign Key (Student_ID) 	REFERENCES Student(Student_ID),
        Constraint Registration_fk1		Foreign Key (Sections_No) 	REFERENCES Sections(Sections_No)
    );


--populates the tables
--#2

Insert Into Student
Values (38214, 'Letersky');

Insert Into Student
Values (54907, 'Alvater');

Insert Into Student
Values (54906, 'Alvater');

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

Insert Into Qualifed
Values(2143, 'ISM 3112', to_date('09/1988', 'mm/yyyy'));

Insert Into Qualifed
Values(2143, 'ISM 3113', to_date('09/1988', 'mm/yyyy'));

Insert Into Qualifed
Values(3467, 'ISM 4212', to_date('09/1995', 'mm/yyyy'));

Insert Into Qualifed
Values(3467, 'ISM 4930', to_date('09/1996', 'mm/yyyy'));

Insert Into Qualifed
Values(4756, 'ISM 3113', to_date('09/1991', 'mm/yyyy'));

Insert Into Qualifed
Values(4756, 'ISM 3112', to_date('09/1991', 'mm/yyyy'));

Insert Into Sections
Values(2712, 'I-2008', 'ISM 3113');

Insert Into Sections
Values(2713, 'I-2008', 'ISM 3113');

Insert Into Sections
Values(2712, 'I-2008', 'ISM 4212');

Insert Into Sections
Values(2712, 'I-2008', 'ISM 4930');

Insert Into Registration
Values(38214, 2714, 'I-2008');

Insert Into Registration
Values(54907, 2714, 'I-2008');

Insert Into Registration
Values(54907, 2715, 'I-2008');

Insert Into Registration
Values(66324, 2713, 'I-2008');

--2
Select *
From Student
--4
--a
Alter Table Student
Add Class_ varchar2(20);

ALTER TABLE Student DROP COLUMN Class_; --this drops the recently created  column so the code can just run

--b
Drop Table Registration 	CASCADE CONSTRAINTS;

--c
Alter Table Faculty
modify Faculty_Name VARCHAR2(40);

--5
--a
Insert Into Student Values
(65798, 'Lopez');

Delete From Student
Where Student_Name = 'Lopez';

Insert Into Student (Student_ID, Student_Name) Values
(65798, 'Lopez');
--b
Delete From Student
Where Student_Name = 'Lopez';

--c
Alter Table Course
modify Course_Name VARCHAR2(40); --increases the size so "Introduction to Relational Databases" can fit

Update Course
Set Course_Name = 'Introduction to Relational Databases'
Where Course_ID = 'ISM 4212';


--6
--a
SELECT *
FROM Student
WHERE Student_ID BETWEEN 0 AND 50000;

--b
SELECT Faculty_Name
FROM Faculty
WHERE Faculty_ID = 4756;

--c

--7
--a
