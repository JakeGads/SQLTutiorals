--1-5
select * from countries;
select Department_ID, Department_Name from departments;
select count(*) from departments;
select UNIQUE country_id from countries;
select count(*) from employees where hire_date > to_date('02-01-2006', 'MM-DD,YYYY');

--6
select loc.country_id, loc.city
from locations loc INNER JOIN departments dep
On dep.department_id = 100;

--7
select FIRST_NAME , LAST_NAME , EMAIL ,PHONE_NUMBER
from employees where department_id = 100 and manager_id = 108;

--8
select FIRST_NAME , LAST_NAME , EMAIL ,PHONE_NUMBER
from employees where last_name = 'Ernst' or last_name = 'Austin' ORDER BY last_name;

--9
select * from countries ORDER BY country_name desc;

--10
select * from locations where location_id >= 1600 and location_id <= 2600 and postal_code is not null;

--11
drop view view_job_history;
create view view_job_history as
select employee_id, job_id, department_id FROM job_history where job_id = 'AC_ACCOUNT' and (department_id = 90 or department_id = 110);

--12
select * from view_job_history;