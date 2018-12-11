Drop Table Cars cascade CONSTRAINTS;
Drop Table Persons cascade CONSTRAINTS;
Drop Table Fords cascade CONSTRAINTS;
Drop Table Salesmen cascade CONSTRAINTS;
Drop Table VWs cascade CONSTRAINTS;
Drop Table OtherCars cascade CONSTRAINTS;
Drop Table Customers cascade CONSTRAINTS;
Drop Table Sales cascade CONSTRAINTS;

Create Table Cars (
    carid   varChar2(20),
    carname varChar2(25),
    color   varChar2(25),
    price   number,
    
    Constraint Cars_pk Primary Key (carid)
);

Create Table Persons (
    pid     varChar2(20),
    pname   varchar2(50),
    
    Constraint Persons_pk Primary Key (pid)
);

Create Table Fords(
    carId   varChar2(20),
    carname varChar2(50),
    maintenance varChar2(50),
    
    Constraint Fords_pk Primary Key (carId)
);
Create Table Salesmen(
    salesmenid   varChar2(20),
    salary       number,
    
    Constraint salesmen_pk Primary Key (salesmenid)
);

Create Table VWs(
    --carId   varChar2(20),
    carname varChar2(50),
    desctiption varChar2(50)
);

Create Table Customers (
    customerID  varChar2(20),
    phone       varChar2(20),
    
    Constraint customer_pk Primary Key (customerid)
);

Create Table OtherCars(
    carName     varChar2(50),
    carModel    varChar2(50)
);


Create Table Sales(
    saleId      varchar2(20),
    carId       varchar2(20),
    carName     varchar2(20),
    salesmanId  varchar2(20),
    customerId  varchar2(20),
    
     CONSTRAINT sale_fk0 FOREIGN KEY ( carid )
        REFERENCES cars ( carid ),
    CONSTRAINT sale_fk1 FOREIGN KEY ( salesmanid )
        REFERENCES salesmen ( salesmenid ),
    CONSTRAINT sale_fk2 FOREIGN KEY ( customerid )
        REFERENCES customers ( customerid ),
        
    Constraint sale_pk Primary Key (saleId)

);

Insert Into Cars Values('900','Bentley','Black',144193.83);
Insert Into Cars Values('382','Maserati','Black',54636.70);
Insert Into Cars Values('784','Subaru','Black',26200.85);
Insert Into Cars Values('284','Ford','Black',233628.98);
Insert Into Cars Values('489','Hyundai','Black',36215.53);
Insert Into Cars Values('888','Aston Martin','Black',140591.45);
Insert Into Cars Values('578','Mitsubishi','Black',166738.08);
Insert Into Cars Values('659','Subaru','Black',95470.85);
Insert Into Cars Values('136','Tata','Black',70156.95);
Insert Into Cars Values('364','Caerham','Black',2694.61);
Insert Into Cars Values('334','BMW','Black',84873.79);
Insert Into Cars Values('571','Kia','Black',23062.92);
Insert Into Cars Values('216','Mazda','Black',190003.48);
Insert Into Cars Values('483','Bentley','Black',90063.75);
Insert Into Cars Values('901','Citroen','Black',68546.42);
Insert Into Cars Values('600','Humer','Black',60978.29);
Insert Into Cars Values('628','Mitsubishi','Black',155842.14);
Insert Into Cars Values('978','MB Roadcars','Black',52901.10);
Insert Into Cars Values('451','Maserati','Black',213168.28);
Insert Into Cars Values('678','Kia','Black',107102.57);
Insert Into Cars Values('503','Chrysler','Black',118045.35);
Insert Into Cars Values('637','Aston Martin','Black',147349.75);
Insert Into Cars Values('369','Citroen','Black',148041.13);
Insert Into Cars Values('799','Tata','Black',119830.94);
Insert Into Cars Values('107','BMW','Black',101768.74);
Insert Into Cars Values('730','Morgan','Black',121756.16);
Insert Into Cars Values('329','Noble','Black',238928.67);
Insert Into Cars Values('718','Saab','Black',139751.59);
Insert Into Cars Values('455','Citroen','Black',127289.66);
Insert Into Cars Values('359','SSC','Black',105942.77);
Insert Into Persons Values('743','Steve Stevenson');
Insert Into Persons Values('373','Steve Stevenson');
Insert Into Persons Values('868','Steve Stevenson');
Insert Into Persons Values('288','Steve Stevenson');
Insert Into Persons Values('782','Steve Stevenson');
Insert Into Persons Values('869','Steve Stevenson');
Insert Into Persons Values('471','Steve Stevenson');
Insert Into Persons Values('261','Steve Stevenson');
Insert Into Persons Values('581','Steve Stevenson');
Insert Into Persons Values('459','Steve Stevenson');
Insert Into Persons Values('860','Steve Stevenson');
Insert Into Persons Values('394','Steve Stevenson');
Insert Into Persons Values('714','Steve Stevenson');
Insert Into Persons Values('221','Steve Stevenson');
Insert Into Persons Values('986','Steve Stevenson');
Insert Into Persons Values('650','Steve Stevenson');
Insert Into Persons Values('440','Steve Stevenson');
Insert Into Persons Values('130','Steve Stevenson');
Insert Into Persons Values('442','Steve Stevenson');
Insert Into Persons Values('283','Steve Stevenson');
Insert Into Persons Values('675','Steve Stevenson');
Insert Into Persons Values('291','Steve Stevenson');
Insert Into Persons Values('582','Steve Stevenson');
Insert Into Persons Values('461','Steve Stevenson');
Insert Into Persons Values('907','Steve Stevenson');
Insert Into Persons Values('166','Steve Stevenson');
Insert Into Persons Values('191','Steve Stevenson');
Insert Into Persons Values('308','Steve Stevenson');
Insert Into Persons Values('348','Steve Stevenson');
Insert Into Persons Values('361','Steve Stevenson');
Insert Into Persons Values('627','Steve Stevenson');
Insert Into Persons Values('705','Steve Stevenson');
Insert Into Persons Values('463','Steve Stevenson');
Insert Into Persons Values('900','Steve Stevenson');
Insert Into Persons Values('879','Steve Stevenson');
Insert Into Persons Values('426','Steve Stevenson');
Insert Into Persons Values('500','Steve Stevenson');
Insert Into Persons Values('346','Steve Stevenson');
Insert Into Persons Values('784','Steve Stevenson');
Insert Into Persons Values('195','Steve Stevenson');
Insert Into Persons Values('804','Steve Stevenson');
Insert Into Persons Values('642','Steve Stevenson');
Insert Into Persons Values('757','Steve Stevenson');
Insert Into Persons Values('955','Steve Stevenson');
Insert Into Persons Values('206','Steve Stevenson');
Insert Into Persons Values('122','Steve Stevenson');
Insert Into Persons Values('715','Steve Stevenson');
Insert Into Persons Values('981','Steve Stevenson');
Insert Into Persons Values('692','Steve Stevenson');
Insert Into Persons Values('129','Steve Stevenson');
Insert Into Persons Values('618','Steve Stevenson');
Insert Into Persons Values('924','Steve Stevenson');
Insert Into Persons Values('940','Steve Stevenson');
Insert Into Persons Values('683','Steve Stevenson');
Insert Into Persons Values('505','Steve Stevenson');
Insert Into Persons Values('271','Steve Stevenson');
Insert Into Persons Values('813','Steve Stevenson');
Insert Into Persons Values('177','Steve Stevenson');
Insert Into Persons Values('313','Steve Stevenson');
Insert Into fords Values('900','Bentley','No Notes');
Insert Into fords Values('382','Maserati','No Notes');
Insert Into fords Values('784','Subaru','No Notes');
Insert Into fords Values('284','Ford','No Notes');
Insert Into fords Values('489','Hyundai','No Notes');
Insert Into fords Values('888','Aston Martin','No Notes');
Insert Into fords Values('578','Mitsubishi','No Notes');
Insert Into fords Values('659','Subaru','No Notes');
Insert Into fords Values('136','Tata','No Notes');
Insert Into fords Values('364','Caerham','No Notes');
Insert Into fords Values('334','BMW','No Notes');
Insert Into fords Values('571','Kia','No Notes');
Insert Into fords Values('216','Mazda','No Notes');
Insert Into fords Values('483','Bentley','No Notes');
Insert Into fords Values('901','Citroen','No Notes');
Insert Into fords Values('600','Humer','No Notes');
Insert Into fords Values('628','Mitsubishi','No Notes');
Insert Into fords Values('978','MB Roadcars','No Notes');
Insert Into fords Values('451','Maserati','No Notes');
Insert Into fords Values('678','Kia','No Notes');
Insert Into fords Values('503','Chrysler','No Notes');
Insert Into fords Values('637','Aston Martin','No Notes');
Insert Into fords Values('369','Citroen','No Notes');
Insert Into fords Values('799','Tata','No Notes');
Insert Into fords Values('107','BMW','No Notes');
Insert Into fords Values('730','Morgan','No Notes');
Insert Into fords Values('329','Noble','No Notes');
Insert Into fords Values('718','Saab','No Notes');
Insert Into fords Values('455','Citroen','No Notes');
Insert Into fords Values('359','SSC','No Notes');
Insert Into SalesMen Values('743',229618.06);
Insert Into SalesMen Values('373',162664.95);
Insert Into SalesMen Values('868',173733.89);
Insert Into SalesMen Values('288',61040.62);
Insert Into SalesMen Values('782',47374.96);
Insert Into SalesMen Values('869',173159.56);
Insert Into SalesMen Values('471',8195.81);
Insert Into SalesMen Values('261',84243.66);
Insert Into SalesMen Values('581',178483.23);
Insert Into SalesMen Values('459',166269.33);
Insert Into SalesMen Values('860',119854.07);
Insert Into SalesMen Values('394',58206.77);
Insert Into SalesMen Values('714',190385.36);
Insert Into SalesMen Values('221',69427.55);
Insert Into SalesMen Values('986',60009.45);
Insert Into SalesMen Values('650',127056.48);
Insert Into SalesMen Values('440',143785.63);
Insert Into SalesMen Values('130',22497.30);
Insert Into SalesMen Values('442',214759.14);
Insert Into SalesMen Values('283',114859.75);
Insert Into SalesMen Values('675',248784.23);
Insert Into SalesMen Values('291',88800.53);
Insert Into SalesMen Values('582',147676.34);
Insert Into SalesMen Values('461',225810.05);
Insert Into SalesMen Values('907',204172.30);
Insert Into SalesMen Values('166',135023.88);
Insert Into SalesMen Values('191',103040.34);
Insert Into SalesMen Values('308',109530.24);
Insert Into SalesMen Values('348',7285.96);
Insert Into SalesMen Values('361',168251.45);
Insert Into VWs Values('Bentley','No Description');
Insert Into VWs Values('Maserati','No Description');
Insert Into VWs Values('Subaru','No Description');
Insert Into VWs Values('Ford','No Description');
Insert Into VWs Values('Hyundai','No Description');
Insert Into VWs Values('Aston Martin','No Description');
Insert Into VWs Values('Mitsubishi','No Description');
Insert Into VWs Values('Subaru','No Description');
Insert Into VWs Values('Tata','No Description');
Insert Into VWs Values('Caerham','No Description');
Insert Into VWs Values('BMW','No Description');
Insert Into VWs Values('Kia','No Description');
Insert Into VWs Values('Mazda','No Description');
Insert Into VWs Values('Bentley','No Description');
Insert Into VWs Values('Citroen','No Description');
Insert Into VWs Values('Humer','No Description');
Insert Into VWs Values('Mitsubishi','No Description');
Insert Into VWs Values('MB Roadcars','No Description');
Insert Into VWs Values('Maserati','No Description');
Insert Into VWs Values('Kia','No Description');
Insert Into VWs Values('Chrysler','No Description');
Insert Into VWs Values('Aston Martin','No Description');
Insert Into VWs Values('Citroen','No Description');
Insert Into VWs Values('Tata','No Description');
Insert Into VWs Values('BMW','No Description');
Insert Into VWs Values('Morgan','No Description');
Insert Into VWs Values('Noble','No Description');
Insert Into VWs Values('Saab','No Description');
Insert Into VWs Values('Citroen','No Description');
Insert Into VWs Values('SSC','No Description');
Insert Into Customers Values ('361','705-768-852');
Insert Into Customers Values ('627','975-377-410');
Insert Into Customers Values ('705','437-678-336');
Insert Into Customers Values ('463','721-811-878');
Insert Into Customers Values ('900','510-768-501');
Insert Into Customers Values ('879','446-317-642');
Insert Into Customers Values ('426','165-710-242');
Insert Into Customers Values ('500','441-965-828');
Insert Into Customers Values ('346','845-209-454');
Insert Into Customers Values ('784','839-553-723');
Insert Into Customers Values ('195','119-710-901');
Insert Into Customers Values ('804','752-713-191');
Insert Into Customers Values ('642','516-757-917');
Insert Into Customers Values ('757','245-511-955');
Insert Into Customers Values ('868','375-621-478');
Insert Into Customers Values ('955','261-106-618');
Insert Into Customers Values ('206','575-270-872');
Insert Into Customers Values ('122','223-971-732');
Insert Into Customers Values ('715','686-617-379');
Insert Into Customers Values ('981','453-706-936');
Insert Into Customers Values ('692','247-607-133');
Insert Into Customers Values ('129','416-245-468');
Insert Into Customers Values ('618','697-274-781');
Insert Into Customers Values ('924','746-925-649');
Insert Into Customers Values ('940','990-579-455');
Insert Into Customers Values ('683','484-574-866');
Insert Into Customers Values ('505','498-450-801');
Insert Into Customers Values ('271','724-637-829');
Insert Into Customers Values ('813','240-582-670');
Insert Into Customers Values ('177','726-855-164');
Insert Into Customers Values ('313','493-951-578');
Insert Into otherCars Values('Bentley','V112');
Insert Into otherCars Values('Maserati','V112');
Insert Into otherCars Values('Subaru','V112');
Insert Into otherCars Values('Ford','V112');
Insert Into otherCars Values('Hyundai','V112');
Insert Into otherCars Values('Aston Martin','V112');
Insert Into otherCars Values('Mitsubishi','V112');
Insert Into otherCars Values('Subaru','V112');
Insert Into otherCars Values('Tata','V112');
Insert Into otherCars Values('Caerham','V112');
Insert Into otherCars Values('BMW','V112');
Insert Into otherCars Values('Kia','V112');
Insert Into otherCars Values('Mazda','V112');
Insert Into otherCars Values('Bentley','V112');
Insert Into otherCars Values('Citroen','V112');
Insert Into otherCars Values('Humer','V112');
Insert Into otherCars Values('Mitsubishi','V112');
Insert Into otherCars Values('MB Roadcars','V112');
Insert Into otherCars Values('Maserati','V112');
Insert Into otherCars Values('Kia','V112');
Insert Into otherCars Values('Chrysler','V112');
Insert Into otherCars Values('Aston Martin','V112');
Insert Into otherCars Values('Citroen','V112');
Insert Into otherCars Values('Tata','V112');
Insert Into otherCars Values('BMW','V112');
Insert Into otherCars Values('Morgan','V112');
Insert Into otherCars Values('Noble','V112');
Insert Into otherCars Values('Saab','V112');
Insert Into otherCars Values('Citroen','V112');
Insert Into otherCars Values('SSC','V112');
Insert Into sales Values('386','900','Bentley','361','924');
Insert Into sales Values('706','382','Maserati','191','924');
Insert Into sales Values('584','784','Subaru','221','346');
Insert Into sales Values('819','284','Ford','261','879');
Insert Into sales Values('792','489','Hyundai','283','955');
Insert Into sales Values('498','888','Aston Martin','288','683');
Insert Into sales Values('680','578','Mitsubishi','394','804');
Insert Into sales Values('341','659','Subaru','440','940');
Insert Into sales Values('776','136','Tata','782','757');
Insert Into sales Values('559','364','Caerham','288','346');
Insert Into sales Values('799','334','BMW','221','981');
Insert Into sales Values('901','571','Kia','675','195');
Insert Into sales Values('933','216','Mazda','714','206');
Insert Into sales Values('270','483','Bentley','743','500');
Insert Into sales Values('921','901','Citroen','907','500');
Insert Into sales Values('961','600','Humer','261','426');
Insert Into sales Values('336','628','Mitsubishi','373','346');
Insert Into sales Values('998','978','MB Roadcars','650','715');
Insert Into sales Values('195','451','Maserati','860','618');
Insert Into sales Values('619','678','Kia','675','981');
Insert Into sales Values('292','503','Chrysler','782','784');
Insert Into sales Values('213','637','Aston Martin','743','868');
Insert Into sales Values('405','369','Citroen','348','981');
Insert Into sales Values('906','799','Tata','675','924');
Insert Into sales Values('434','107','BMW','440','642');
Insert Into sales Values('196','730','Morgan','461','715');
Insert Into sales Values('793','329','Noble','348','683');
Insert Into sales Values('493','718','Saab','442','195');
Insert Into sales Values('888','455','Citroen','221','177');
Insert Into sales Values('922','359','SSC','308','426');

/*
Write a query that lists the name of all salesmen together with the number of their sales
write a statement that discounts all fords by 10%
*/

Select persons.name name, count(*) from salesmen Inner Join Person on salesmen.salesmenid = persons.pid;