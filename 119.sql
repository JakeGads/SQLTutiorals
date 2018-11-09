--subqueries / nested querires
select first_name, last_name
from employees
where employee_id in
(select distinct employee_id
from job_history
);

--corelated subquery
select DISTINCT job_id from jobs
where exists
    (select job_history.job_id
    from job_history
    where job_id = jobs.job_id);
    
--top 5 row
select employee_id
from job_history where rownum <= 5;

select Min(salary) --MAX AVG MIN
from employees
where employee_id > 150;

/*
select location_id from locations
Union all
select location_id from deparments;
*/

--any
select employee_id
from employees
where job_id = any
(select job_id from job_history where department_id > 100);


--all
select employee_id
from employees
where job_id = all
(select job_id from job_history where department_id > 100);

--case conditions
select employee_id, salary,
Case
    When salary <= 10000 then salary*1.1
    When (salary > 10000 and salary < 20000) then salary*1.4
    When salary >= 20000 then salary *1.4
End as increased_sal
From employees;

