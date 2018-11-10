    --drops all tables
    Drop Table  Student     	CASCADE CONSTRAINTS;
    Drop Table  Faculty 		CASCADE CONSTRAINTS;
    Drop Table  Course 			CASCADE CONSTRAINTS;
    Drop Table  Qualifed 		CASCADE CONSTRAINTS;
    Drop Table  Sections 		CASCADE CONSTRAINTS;
    Drop Table  Registration 	CASCADE CONSTRAINTS;
    
    --creates the tables
    --#1
    Create Table Student(
        Student_ID		Integer,
        Student_Name	varchar2(25),
    
        Constraint student_pk Primary Key (Student_ID)
    );
    
    Create Table Faculty(
        Faculty_ID		Integer,
        Faculty_Name	varchar2(25),
    
        Constraint faculty_pk Primary Key (Faculty_ID)
    );
    
    Create Table Course(
        Course_ID		varchar2(8),
        Course_Name		varchar2(15),
    
        Constraint course_pk Primary Key (Course_ID)
    );
    
    Create Table Qualifed(
        Faculty_ID		Integer,
        Course_ID		varchar2(10),
        DateQualified	Date,
        
        Constraint Qualifed_pk 	    Primary Key (Faculty_ID,Course_ID),
        Constraint Qualifed_fk 	    Foreign Key (Course_ID) 	REFERENCES Course(Course_ID),
        Constraint Qualifed1_fk 	Foreign Key (Faculty_ID) 	REFERENCES Faculty(Faculty_ID)
    );
    
    Create Table Sections(
        Sections_No		Integer,
        Semester		varchar2(10),
        Course_ID		varchar2(10),
        
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
Values(2714, 'I-2008', 'ISM 4212');
Insert Into Sections
Values(2715, 'I-2008', 'ISM 4930');
Insert Into Registration
Values(38214, 2714, 'I-2008');
Insert Into Registration
Values(54907, 2714, 'I-2008');
Insert Into Registration
Values(54907, 2715, 'I-2008');
Insert Into Registration
Values(66324, 2713, 'I-2008');

--1
--a Display the course ID and course name for all courses with an ISM prefix.
select course_name, Course_ID from course where course_name ^= 'ISM';

--b Display all courses for which Professor Berndt has been qualified.
select COURSE_ID ,COURSE_NAME  from course where course_id in (select course_id from Qualifed where Faculty_ID in (select Faculty_ID from faculty where Faculty_Name = 'Berndt'));

--c Display the class roster, including student name, for all students enrolled in section 2714 of ISM 4212.
select STUDENT_ID ,STUDENT_NAME  from student where student_id in (select student_Id from registration where sections_no = 2714 and sections_no in (select sections_no from sections where course_id = 'ISM 4212'));

--2 Write an SQL query to answer the following question: Which instructors are qualified to teach ISM 3113?
select FACULTY_ID , FACULTY_NAME  from faculty where faculty_id in(select faculty_id from qualifed where course_id = 'ISM 3113');

--3 Write an SQL query to answer the following question: Is any instructor qualified to teach ISM 3113 and not qualified to teach ISM 4930?
select count(*) from faculty where faculty_id in (select faculty_id from qualifed where course_id = 'ISM 3113' and not course_id = 'ISM 4930');
--3 (shows the teachers)
select FACULTY_ID ,FACULTY_NAME  from faculty where faculty_id in (select faculty_id from qualifed where course_id = 'ISM 3113' and not course_id = 'ISM 4930');

--4
--a How many students were enrolled in section 2714 during semester I-2008?
select count(*) from student where student_id in (select student_id from registration where Sections_No = 2714 and Semester = 'I-2008');
--a (shows the actual output)
select STUDENT_ID ,STUDENT_NAME  from student where student_id in (select student_id from registration where Sections_No = 2714 and Semester = 'I-2008');

--b How many students were enrolled in ISM 3113 during semester I-2008?
select count(*) from student where student_id in (select student_id from registration where Sections_No = 3113 and Semester = 'I-2008');
--b (shows students)
select STUDENT_ID ,STUDENT_NAME  from student where student_id in (select student_id from registration where Sections_No = 3113 and Semester = 'I-2008');

--5 Write an SQL query to answer the following question: Which students were not enrolled in any courses during semester I-2008?
select STUDENT_ID ,STUDENT_NAME  from student where student_id  not in(select student_id from registration where semester = 'I-2008');