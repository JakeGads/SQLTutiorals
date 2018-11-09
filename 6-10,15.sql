Drop Table  tutor 		    CASCADE CONSTRAINTS;
Drop Table  student         CASCADE CONSTRAINTS;
Drop Table  Match_History   CASCADE CONSTRAINTS;
create table tutor(
    tutor_ID    integer,
    cert_date   date,
    status      varchar2(25),
    
    Constraint tutor_pk Primary Key (tutor_ID)
);

create table Student(
    student_ID      integer,
    read            number,    
    Constraint student_pk Primary Key (studnet_ID)
);

create table Match_History(
    Match_ID    integer,
    tutor_ID    integer,
    student_ID  integer,
    startDate   date,
    endDate     date,
    
    Constraint Match_History_pk 	Primary Key (Match_ID),
    Constraint Match_History_fk 	Foreign Key (tutor_ID) 	    REFERENCES tutor(tutor_ID),
    Constraint Match_History_fk1 	Foreign Key (student_ID) 	REFERENCES Student(student_ID)
);

/*
create table Tutor_Report(
    Match_ID    integer,
    Month       date,
    hours       integer,
    lessons     date,
    
    
    Constraint Tutor_Report_pk 	    Primary Key (Match_ID, month),
    Constraint Tutor_Report_fk 	    Foreign Key (Match_ID) 	REFERENCES Match_History(match_ID)
);
*/

Insert Into tutor
Values (100, TO_DATE('01-05-2008','MM-DD-YYYY'), 'Active');
Insert Into tutor
Values (101, TO_DATE('01-05-2008','MM-DD-YYYY'), 'Temp Stop');
Insert Into tutor
Values (102, TO_DATE('01-05-2008','MM-DD-YYYY'), 'Dropped');
Insert Into tutor
Values (103, TO_DATE('05-22-2008','MM-DD-YYYY'), 'Active');
Insert Into tutor
Values (104, TO_DATE('05-22-2008','MM-DD-YYYY'), 'Active');
Insert Into tutor
Values (105, TO_DATE('05-22-2008','MM-DD-YYYY'), 'Temp Stop');
Insert Into tutor
Values (106, TO_DATE('05-22-2008','MM-DD-YYYY'), 'Active');

Insert Into student
values(3000, 2.3);
Insert Into student
values(3001, 5.6);
Insert Into student
values(3002, 1.3);
Insert Into student
values(3003, 3.3);
Insert Into student
values(3004, 2.7);
Insert Into student
values(3005, 4.8);
Insert Into student
values(3006, 7.8);
Insert Into student
values(3007, 1.5);

--go back to 1 and 4
Insert Into Match_History
values(2, 101, 3001, TO_DATE('01-15-2008','MM-DD-YYYY'), TO_DATE('05-15-2008','MM-DD-YYYY')); 