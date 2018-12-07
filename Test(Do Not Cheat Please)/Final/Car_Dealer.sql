Drop Table Cars cascade CONSTRAINTS;
Drop Table Persons cascade CONSTRAINTS;
Drop Table Fords cascade CONSTRAINTS;
Drop Table Salesmen cascade CONSTRAINTS;
Drop Table VWs cascade CONSTRAINTS;
Drop Table OtherCars cascade CONSTRAINTS;
Drop Table Sale cascade CONSTRAINTS;

Create Table Cars (
    carid   varChar2(10),
    carname varChar2(25),
    color   varChar2(25),
    price   number,
    
    Constraint Cars_pk Primary Key (carid, carname)
);

Create Table Persons (
    pid     varChar2(10),
    pname   varchar2(50),
    
    Constraint Persons_pk Primary Key (pid)
);

Create Table Fords(
    carId   varChar2(10),
    carname varChar2(50),
    maintenance varChar2(50),
    Constraint Fords_fk 	Foreign Key (carid) 	REFERENCES cars(carid),
    Constraint Fords_fk 	Foreign Key (carname) 	REFERENCES cars(carname),
    Constraint Fords_pk Primary Key (carId)
);
Create Table Salesmen(
    salesmenid   varChar2(10),
    salary       number,
    
    Constraint salesmen_fk 	Foreign Key (salesmenid) 	REFERENCES Persons(pid),
    Constraint salesmen_pk Primary Key (salesmenid)
);

Create Table VWs(
    --carId   varChar2(10),
    carname varChar2(50),
    desctiption varChar2(50),
    Constraint VW_fk 	Foreign Key (carname) 	REFERENCES cars(carname),
    Constraint VW_pk Primary Key (carname)
);

Create Table Customers (
    customerID  varChar2(10),
    phone       varChar2(20),
    
    Constraint customer_fk 	Foreign Key (customerid) 	REFERENCES Persons(pid),
    Constraint customer_pk Primary Key (customerid)
);

Create Table OtherCars(
    carName     varChar2(50),
    carModel    varChar2(50),
    
    Constraint OtherCars_fk 	Foreign Key (carname) 	REFERENCES cars(carname),
    Constraint OtherCars_pk Primary Key (carname)
);