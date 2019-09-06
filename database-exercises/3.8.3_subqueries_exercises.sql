use employees;
describe employees;
describe dept_manager; 

select first_name, last_name, hire_date
from employees
where hire_date in(
select hire_date from employees
where emp_no = "101010" )

select title, count(*)
from titles
where emp_no in(select emp_no from employees 
where first_name = "Aamod")
group by title;

select count(*) 
from employees
where emp_no in (select emp_no from dept_emp 
where to_date != "9999-01-01");

select first_name, last_name from employees
where emp_no in (select emp_no from dept_manager where to_date = "9999-01-01" and gender = 'F')


select first_name, last_name, sal.salary from employees
join salaries as sal
on sal.emp_no = employees.emp_no
where employees.emp_no in(select emp_no from salaries where salary > (select avg(salary) from salaries) and to_date = "9999-01-01") and sal.to_date='9999-01-01';


 select count(*),count(*)/select count(*) from salaries where to_date>now())*100 from salaries where to_date>now() and salary >(select max(salary)-stddev(salary) from salaries)
  from employees
join salaries as sal
on sal.emp_no = employees.emp_no
where employees.emp_no in(select emp_no from salaries where salary > (select max(salary) - STDDEV(salary) from salaries) and to_date = "9999-01-01") and sal.to_date='9999-01-01';

select count(*),count(*)/(select count(*) from salaries where to_date="9999-01-01")*100 
from salaries where to_date="9999-01-01"and salary >(select max(salary)-stddev(salary) 
from salaries)
 