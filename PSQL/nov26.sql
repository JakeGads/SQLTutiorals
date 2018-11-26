--SPOOL myoutputfile.txt
SET serveroutput ON
SELECT * FROM employees;

DECLARE
--variable definition
    --strings
    message     varchar2(20) := 'Hello World';
    salutation  varchar2(20);
    greetings   varchar2(100);
    
    --ints
    x           integer := 1;
    y           integer := 2;
    z           integer;
    w           integer;
    
    --global variables
    num1        integer := 2;
    num2        integer := 3;
    
    --employee jawns
    e_id employees.employee_id%type := 100;
    e_name employees.last_name%type;
    e_job_id employees.job_id%type;
    e_sal employees.salary%type;
    
    --constant
    pi CONSTANT number := 3.1415;
    
BEGIN
--PL/SQL executable statement
    dbms_output.put_line(message);
    
    --concatination
    salutation := 'Mr.Kevin';
    greetings := 'How ya doin';
    dbms_output.put_line(salutation || ' ' || greetings);
    
    --integers
    z := x - y;
    w := x * y;
    dbms_output.put_line('Value of z: ' || z);
    dbms_output.put_line('Value of w: ' || w);
    
    dbms_output.put_line('Value of num1: ' || num1);
    dbms_output.put_line('Value of num2: ' || num2);
    
    --nested jawn
    DECLARE
    --local variables
        num3 integer := 3;
        
    BEGIN
        dbms_output.put_line('Value of num3: ' || num3);
    END;
    
    --select statement
    SELECT last_name, job_id, salary
    INTO e_name, e_job_id, e_sal
    FROM employees
    WHERE employee_id = e_id;
    dbms_output.put_line(e_name || ' has job id ' || e_job_id || ' and has salary ' || e_sal );
    
--EXCEPTION
END;

--loops
SET serveroutput ON
DECLARE
--declare variable    
    --base loop
    i number := 10;
    
    --while loop
    a number(2) := 10;
    
    --for loop
    b number(1);
    c number(1);
    
    --input box
    name_ varchar2(20);
    company varchar2(20);
    choice char(1);
    
    --arrays
    TYPE namelist IS VARRAY(5) OF varchar2(10);
    TYPE gradelist IS VARRAY(5) OF integer;
    names namelist;
    grades gradelist;
    total integer;
    
BEGIN
    --loop statement
    LOOP
        dbms_output.put_line(i);
        i := i +1;
        IF i > 10 THEN
            EXIT;
        END IF;
    END LOOP;

    dbms_output.put_line('After exiting the value of i is ' || i);
    
    --while statement
    WHILE a < 15 LOOP
        dbms_output.put_line(a);
        a := a + 1;
    END LOOP;
    
    --for loop
    << outer_loop >>
    FOR b IN 1..5 LOOP
        << inner_loop >>
        FOR c IN 1..3 LOOP
            dbms_output.put_line('Value of b is ' || b);
            dbms_output.put_line('Value of c is ' || c);
        END LOOP;
    END LOOP;
    
    --input box
    name_ := 'John';
    company := 'PPL';
    IF '&choice' = 'y' THEN
    dbms_output.put_line(name_ || ' works at ' || company );
    END IF;
    
    --arrays
    names := namelist('John', 'Jane', 'Aiden', 'Sean', 'Liz');
    grades := gradelist(90,78,98,47,87);
    total := names.count;
    FOR x in 1.. total LOOP
        dbms_output.put_line(names(x) || ' earned a ' || grades(x) );
    END LOOP;
END;

--Procedures
DECLARE
    a number;
    b number;
    c number;
PROCEDURE findMaximum(a IN number, b IN number, c OUT number) is

BEGIN
    IF a > b THEN
        c := a;
    ELSE
        c := b;
END If;
End;

--SPOOL OFF;

Begin
    a := 23;
    b := 34;
    findMaximum(a,b,c);
    dbms_output.put_line('Maximum of a and b is ' || c);
end;

Create or Replace PROCEDURE findMaximum(x IN number, y IN number, z OUT number) as
BEGIN
    IF x > y THEN
        z := x;
    ELSE
        z := y;
    End If;
End;
/

--Functions
Declare
    a number;
    b number;
    c number;
Function findmax(a In Number, b In Number) return number is c number;
Begin
    if (a > b) then
        c := a;
    else
        c := b;
    end if;
    return c;
End;

Begin
    a := 23;
    b := 34;
    c := findMax(a,b);
    DBMS_OUTPUT.PUT_Line('Max is ' || c);
End;

--Cursor
Declare
    e_id employees.employee_id%type;
    e_name employees.last_name%type;
    Cursor e_employee is select employee_id, last_name from employees;
    Begin
    Open e_employee;
    Loop
        Fetch e_employee into e_id, e_name;
            Exit When e_employee%notfound;
        DBMS_OUTPUT.PUT_Line(e_id || ' ' || e_name);
    End Loop;
    close e_employee;
    End;