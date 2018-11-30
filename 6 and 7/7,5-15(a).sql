Drop Table  tutor 		    CASCADE CONSTRAINTS;
Drop Table  student         CASCADE CONSTRAINTS;
Drop Table  Match_History   CASCADE CONSTRAINTS;
Drop Table  Tutor_Report    CASCADE CONSTRAINTS;
create table tutor(
    tutor_ID    integer,
    cert_date   date,
    status      varchar2(25),
    
    Constraint tutor_pk Primary Key (tutor_ID)
);

create table Student(
    studentID      integer,
    read            number,    
    Constraint student_pk Primary Key (studentID)
);

create table Match_History(
    Match_ID    integer,
    tutor_ID    integer,
    studentID  integer,
    startDate   date,
    endDate     date,
    
    Constraint Match_History_pk 	Primary Key (Match_ID),
    Constraint Match_History_fk 	Foreign Key (tutor_ID) 	    REFERENCES tutor(tutor_ID),
    Constraint Match_History_fk1 	Foreign Key (studentID) 	REFERENCES Student(studentID)
);


create table Tutor_Report(
    Match_ID    integer,
    Month       date,
    hours       integer,
    lessons     integer,
    
    
    Constraint Tutor_Report_pk 	    Primary Key (Match_ID, month),
    Constraint Tutor_Report_fk 	    Foreign Key (Match_ID) 	REFERENCES Match_History(match_ID)
);

Insert Into tutor Values (100, TO_DATE('01-05-2008','MM-DD-YYYY'), 'Active');
Insert Into tutor Values (101, TO_DATE('01-05-2008','MM-DD-YYYY'), 'Temp Stop');
Insert Into tutor Values (102, TO_DATE('01-05-2008','MM-DD-YYYY'), 'Dropped');
Insert Into tutor Values (103, TO_DATE('05-22-2008','MM-DD-YYYY'), 'Active');
Insert Into tutor Values (104, TO_DATE('05-22-2008','MM-DD-YYYY'), 'Active');
Insert Into tutor Values (105, TO_DATE('05-22-2008','MM-DD-YYYY'), 'Temp Stop');
Insert Into tutor Values (106, TO_DATE('05-22-2008','MM-DD-YYYY'), 'Active');
Insert Into student values(3000, 2.3);
Insert Into student values(3001, 5.6);
Insert Into student values(3002, 1.3);
Insert Into student values(3003, 3.3);
Insert Into student values(3004, 2.7);
Insert Into student values(3005, 4.8);
Insert Into student values(3006, 7.8);
Insert Into student values(3007, 1.5);
Insert Into Match_History values(2, 101, 3001, TO_DATE('01-15-2008','MM-DD-YYYY'), TO_DATE('05-15-2008','MM-DD-YYYY')); 
Insert Into Match_History values(3, 102, 3002, TO_DATE('02-10-2008','MM-DD-YYYY'), TO_DATE('03-01-2008','MM-DD-YYYY'));
Insert Into Match_History values(5, 103, 3004, TO_DATE('06-01-2008','MM-DD-YYYY'), TO_DATE('06-15-2008','MM-DD-YYYY'));
Insert Into Match_History values(6, 104, 3005, TO_DATE('06-01-2008','MM-DD-YYYY'), TO_DATE('06-15-2008','MM-DD-YYYY'));
Insert Into Match_History (Match_id, Tutor_id, studentID, startDate) values(7, 104, 3006, TO_DATE('01-15-2008','MM-DD-YYYY'));
Insert Into Match_History (Match_id, Tutor_id, studentID, startDate) values(4, 106, 3003, TO_DATE('05-28-2008','MM-DD-YYYY'));
Insert Into Match_History (Match_id, Tutor_id, studentID, startDate) values(1, 100, 3000, TO_DATE('01-10-2008','MM-DD-YYYY'));
Insert Into Tutor_Report values(1, to_date('06/08', 'MM/YY'), 8, 4);
Insert Into Tutor_Report values(4, to_date('06/08', 'MM/YY'), 8, 6);
Insert Into Tutor_Report values(5, to_date('06/08', 'MM/YY'), 4, 4);
Insert Into Tutor_Report values(4, to_date('07/08', 'MM/YY'), 10, 5);
Insert Into Tutor_Report values(1, to_date('07/08', 'MM/YY'), 4, 2);

--7 add Math Score to students table
Alter Table student add math_score number;

--8 add subject to tutors limit
Alter Table tutor add subject varchar2(30);
Alter Table tutor add CONSTRAINT subject_check  check (subject in ( 'Reading', 'Math', 'ESL'));

--9 see end



--10 command to find any tutors who have not sent a report for july
select * from tutor where tutor_id in (select tutor_id from match_history where match_id not in(select match_id from tutor_report));


--11 Where do you think student and tutor information such as name, address, phone, and e-mail should be kept? Write the necessary SQL commands to capture this information.
Drop Table Student_Contact_Sheet    CASCADE CONSTRAINTS;
Create Table Student_Contact_Sheet(
    studentId   INTEGER,
    name        varchar2(45),
    street      varchar2(45),
    city        varchar2(45),
    state       varchar2(45),
    zip         varchar2(8),
    phone       varchar2(45),
    email       varchar2(45),
    
    
    Constraint Student_Contact_Sheet_pk         Primary Key (studentId),
    Constraint Student_Contact_Sheet_fk 	    Foreign Key (studentId) 	REFERENCES Student(studentId)
);

Drop Table Tutor_Contact_Sheet      CASCADE CONSTRAINTS;
Create Table Tutor_Contact_Sheet(
    tutor_Id    INTEGER,
    name        varchar2(45),
    street      varchar2(45),
    city        varchar2(45),
    state       varchar2(45),
    zip         varchar2(8),
    phone       varchar2(45),
    email       varchar2(45),
    
    
    Constraint Tutor_Contact_Sheet_pk         Primary Key (tutor_Id),
    Constraint Tutor_Contact_Sheet_fk 	    Foreign Key (tutor_Id) 	REFERENCES tutor(tutor_Id)
);

Insert Into Student_Contact_Sheet VALUES(3000, 'Mick Gadaleta', '824 Forrest St', 'Lansdale','PA','19446','215-362-7606','mick.gads@gmail.com');
Insert Into Student_Contact_Sheet VALUES(3001, 'Ryan Gadaleta', '824 Forrest St', 'Lansdale','PA','19446','215-362-7606','rygads14@gmail.com');
Insert Into Student_Contact_Sheet VALUES(3002, 'Amy Gadaleta', '824 Forrest St', 'Lansdale','PA','19446','215-362-7606','amylougads@gmail.com');
Insert Into Student_Contact_Sheet VALUES(3003, 'Luis Acevedo', '2755 Station Ave', 'Center Valley', 'PA', '18034', '1784', 'Luis.Acevedo@desales.edu');
Insert Into Student_Contact_Sheet VALUES(3004, 'David Achenbach', '2755 Station Ave', 'Center Valley', 'PA', '18034', '1314', 'David.Achenbach@desales.edu');
Insert Into Student_Contact_Sheet VALUES(3005, 'Kamran Afshar', '2755 Station Ave', 'Center Valley', 'PA', '18034', '2248', 'Kamran.Afshar@desales.edu');
Insert Into Student_Contact_Sheet VALUES(3006, 'Marc Albanese', '2755 Station Ave', 'Center Valley', 'PA', '18034', '1213', 'Marc.Albanese@desales.edu');
Insert Into Student_Contact_Sheet VALUES(3007, 'Leah Alicea', '2755 Station Ave', 'Center Valley', 'PA', '18034', '1427', 'Leah.Alicea@desales.edu');

Insert Into Tutor_Contact_Sheet Values (100, 'Vilma Almanza', '2755 Station Ave', 'Center Valley', 'PA', '18034', '1287', 'Vilma.Almanza@desales.edu');
Insert Into Tutor_Contact_Sheet Values (101, 'Aidin Amirshokoohi', '2755 Station Ave', 'Center Valley', 'PA', '18034', '1675', 'Aidin.Amirshokoohi@desales.edu');
Insert Into Tutor_Contact_Sheet Values (102, 'Gregg Amore', '2755 Station Ave', 'Center Valley', 'PA', '18034', '1214', 'Gregg.Amore@desales.edu');
Insert Into Tutor_Contact_Sheet Values (103, 'Susan Anthony', '2755 Station Ave', 'Center Valley', 'PA', '18034', '1740', 'Susan.Anthony@desales.edu');
Insert Into Tutor_Contact_Sheet Values (104, 'Maria Arango', '2755 Station Ave', 'Center Valley', 'PA', '18034', '1260', 'Maria.Arango@desales.edu');
Insert Into Tutor_Contact_Sheet Values (105, 'Jane Arenas', '2755 Station Ave', 'Center Valley', 'PA', '18034', '1489', 'Jane.Arenas@desales.edu');
Insert Into Tutor_Contact_Sheet Values (106, 'Steven Arner', '2755 Station Ave', 'Center Valley', 'PA', '18034', '1666', 'Steven.Arner@desales.edu');


--12 List all active students in June by name. (Make up names and other data if you are actually building a prototype database.) 
--Include the number of hours students received tutoring and how many lessons they completed.
select student.name, tr.hours, tr.lessons
from student_contact_sheet student
INNER JOIN Match_History mh ON mh.studentid = student.studentid
INNER JOIN tutor_report tr ON tr.match_id = mh.match_id
WHERE tr.month = TO_DATE('06', 'mm');
--13 Which tutors, by name, are available to tutor? Write the SQL command.
select name from tutor_contact_sheet where tutor_id not in (select tutor_id from tutor where status = 'Active');

--14 Which tutor needs to be reminded to turn in reports? Write the SQL command.
select UNIQUE t.name
from  tutor_contact_sheet t
INNER JOIN Match_History mh ON mh.tutor_id = t.tutor_id
where mh.match_id not in (select match_id from tutor_report);







Drop Table  tutor 		    CASCADE CONSTRAINTS;
create table tutor(
    tutor_ID    integer,
    cert_date   date,
    status      varchar2(25),
    subject varchar2(30),
    
    CONSTRAINT subject_check  check (subject in ( 'Reading', 'Math', 'ESL')),
    Constraint tutor_pk Primary Key (tutor_ID, subject)
);