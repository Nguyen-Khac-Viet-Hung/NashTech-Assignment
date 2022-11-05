---- Exercise 1 ----
select department_id from employees where last_name = 'Zlotkey'
select last_name, hire_date from employees
where department_id in(select department_id from employees where last_name = 'Zlotkey')
and last_name <> 'Zlotkey'

----Exercise 2----
Select employee_id,last_name, salary from employees
where salary >(select AVG(salary) from employees)
order by salary

----Exercise 3----
Select department_id, last_name from employees
where department_id in (Select department_id from employees where last_name like '%u%')

----Exercise 4----
Select last_name, department_id, job_id from employees 
where department_id in ( select department_id from departments where location_id = 1700)

----Exercise 5----
select last_name, salary from employees where manager_id in (select employee_id from employees where last_name = 'King')
----Exercise 6----
select department_id, last_name, job_id
from employees 
where department_id in (select department_id from departments where department_name = 'Executive')
----Exercise 7----
select employee_id, last_name, salary
from employees
where department_id in (select department_id from employees where last_name LIKE '%u%')
and salary > ( select avg(salary) from employees);
----Exercise 8----
select max(salary) as 'Maximum', min(salary) as 'Minimum', Sum(salary) as 'Sum', ROUND(avg(salary),0) as 'Average'
from employees;
----Exercise 9----
select last_name, len(last_name) as 'Length'
from employees
where last_name LIKE 'J%' 
or last_name LIKE 'A%' 
or last_name LIKE 'M%'
Order by last_name asc
----Exercise 10----
select employee_id, last_name, salary, ROUND(salary*1.155,0) as 'New Salary'
from employees;
----Exercise 11----
select e.last_name, e.department_id, d.department_name
from employees e
full join departments d
on e.department_id = d.department_id;
----Exercise 12----
select e.employee_id, e.first_name, e.last_name, d.location_id
from employees e
join departments d
on e.department_id = d.department_id
where hire_date > (select hire_date from employees where employee_id = '100')
and location_id in (select location_id from locations where city = 'Toronto');
