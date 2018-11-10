--Table Drop
    Drop Table  tableName 		CASCADE CONSTRAINTS;

--Create TABLE
	Create Table tableName(
		Name	varchar2(35),
		ID		INTEGER	Not Null,
		
		Constraint table_pk Primary Key (ID)
	);
	
--Inseting all VALUES
	Insert Into tableName
	Values	('Jake Gadaleta', 200);
	--or
	