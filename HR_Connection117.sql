--joining tables
select emp.employee_id, start_date, emp.job_id
from employees emp, job_history jh
Where emp.employee_id = jh.employee_id;

select emp.employee_id, start_date, emp.job_id
from employees emp INNER JOIN job_history jh
On emp.employee_id = jh.employee_id;

select emp.employee_id, start_date, emp.job_id
from employees emp RIGHT OUTER JOIN job_history jh
On emp.employee_id = jh.employee_id;

--or

select emp.employee_id, start_date, emp.job_id
from employees emp LEFT OUTER JOIN job_history jh
On emp.employee_id = jh.employee_id;

--or

select emp.employee_id, start_date, emp.job_id
from employees emp FULL OUTER JOIN job_history jh
On emp.employee_id = jh.employee_id;

select e.employee_id, start_date, jh.job_id, job_title
from employees e, job_history jh, jobs j
where e.employee_id = jh.employee_id
and jh.job_id = j.job_id
and start_date > to_date('01-JAN-02', 'DD-MON-YY')
order by employee_id;

--self join
select d.department_id As ID, d.department_name AS DNAME, d.manager_id AS Manager
from departments d, departments m
where d.department_id = m.department_id
and d.manager_id is not NULL

