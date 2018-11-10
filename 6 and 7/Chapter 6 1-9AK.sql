--Problem 1
DROP TABLE student cascade constraints;
DROP TABLE faculty cascade constraints;
DROP TABLE course cascade constraints;
DROP TABLE section cascade constraints;
DROP TABLE registration cascade constraints;
DROP TABLE qualified cascade constraints;
DROP TABLE assignment cascade constraints;
Drop View Student_View;
--Student Table
create table Student
(
StudentID int,
StudentName varchar2(25),

constraint student_pk primary key(StudentID)
);

--Faculty Table
create table Faculty
(
FacultyID int,
FacultyName varchar2(25),

constraint faculty_pk primary key(FacultyID)
);

--Course Table
create table Course
(
CourseID varchar2(8),
CourseName varchar2(25),

constraint course_pk primary key(CourseID)
);

--Qualified Table
create table Qualified
(
CourseID varchar2(8),
FacultyID int,
DateQualified Date,

constraint qualified_pk primary key(CourseID, FacultyID),
constraint qualified_fk1 foreign key(CourseID)references Course (CourseID),
constraint qualified_fk2 foreign key(FacultyID)references Faculty (FacultyID)
);

--Section
create table Section
(
SectionNo int,
CourseID varchar2(8),
Semester varchar2(7),

constraint section_pk primary key(SectionNo),
constraint qualified_fk foreign key(CourseID)references Course (CourseID)
);

--Registration
create table Registration
(
StudentID int,
SectionNo int,
Semester varchar2(7),

constraint registration_pk primary key(SectionNo,StudentID),
constraint registration_fk1 foreign key(StudentID)references Student (StudentID),
constraint registration_fk2 foreign key(SectionNo)references Section (SectionNo)
);

create table assignment
(
FacultyID int,
SectionNo int,
AssignmentDate date,

constraint assignement_pk primary key(SectionNo,FacultyID),
constraint assignement_fk1 foreign key(FacultyID)references Faculty (FacultyID),
constraint assignement_fk2 foreign key(SectionNo)references Section (SectionNo)
);

--Data to test 2-9

--Students
insert into student
values(38214, 'Letersky');
insert into student
values(54907, 'Altvater');
insert into student
values(66324, 'Aiken');
insert into student
values(70542, 'Marra');

--Faculty
insert into faculty
values(2143, 'Birkin');
insert into faculty
values(3467, 'Berndt');
insert into faculty
values(4756, 'Collins');

--Course
insert into course
values('ISM 3113', 'Syst Analysis');
insert into course
values('ISM 3112', 'Syst Design');
insert into course
values('ISM 4212', 'Database');
insert into course
values('ISM 4930', 'Networking');

--Section
insert into section
values (2712, 'ISM 3113', 'I-2008');
insert into section
values (2713, 'ISM 3113', 'I-2008');
insert into section
values (2714, 'ISM 4212', 'I-2008');
insert into section
values (2715, 'ISM 4930', 'I-2008');

--Registration
insert into registration
values (38214,2714,'I-2008');
insert into registration
values (54907,2714,'I-2008');
insert into registration
values (54907,2715,'I-2008');
insert into registration
values (66324,2713,'I-2008');

--Qualified 
insert into qualified
values ('ISM 3112', 2143,  To_date ('01/09/1988', 'DD/MM/YYYY'));
insert into qualified
values ('ISM 3113', 2143,  To_date ('01/09/1988', 'DD/MM/YYYY'));
insert into qualified
values ('ISM 4212', 3467,  To_date ('01/09/1995', 'DD/MM/YYYY'));
insert into qualified
values ('ISM 4930', 3467,  To_date ('01/09/1996', 'DD/MM/YYYY'));
insert into qualified
values ('ISM 3113', 4756,  To_date ('01/09/1991', 'DD/MM/YYYY'));
insert into qualified
values ('ISM 3112', 4756,  To_date ('01/09/1988', 'DD/MM/YYYY'));

--Problem 2
create view Student_View as
select StudentID,StudentName from Student;

--Problem 3 
--Succefully implemented by accident as I already included foreign keys code cmmented out 
--below as it is already active in the table
--constraint qualified_fk foreign key(CourseID)references Course (CourseID)

--Problem 4
--a
alter table student
add class varchar2(20);
--b (commented out as it is implemented above
--Drop table registration;
--c
alter table faculty
modify FacultyName varchar2(40);

--Problem 5
--a (Won't run after 4a has run as there is not class column)
insert into student
values(54908, 'Lopez');
insert into student
(StudentID,StudentName)
values(65798, 'Lopez');
--b
delete from student
where StudentID = 65798;
--c
alter table course
modify CourseName varchar(45);
update course
set CourseName='Introduction to Relational Databases'
where CourseName='Database';

--Problem 6
--a
select StudentID,StudentName
from STUDENT
where StudentID<50000;
--b
select FacultyID,FacultyName
from FACULTY
where FacultyID=4756;
--c
select min(SectionNo)
from registration
where Semester='I-2008';

--Problem 7
--a
select count(*)
from registration
where SectionNo=2714 and Semester='I-2008';
--b
select FacultyID,CourseID,DateQualified
from qualified
where DateQualified >= to_date('01/01/1993','DD/MM/YYYY');

--Problem 8
--a
select StudentID
from Registration
where SectionNo=2714 or SectionNo=2715;
--b
select distinct FacultyID
from Qualified
where CourseID != 'ISM 3112' and courseID != 'ISM 3113';
--c
select distinct CourseID
from Section
where Semester in ('I-2008');

--Problem 9
--a
select distinct CourseID
from Section;
--b
Select StudentName
from Student
order by StudentName;
--c
select SectionNo,Semester,StudentID
from registration
where Semester='I-2008'
group by SectionNo,Semester,StudentID
order by SectionNo,StudentID;
--d
select CourseID,CourseName
from course
order by CourseID;