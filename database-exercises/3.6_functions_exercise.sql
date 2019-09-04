use employees; 
describe employees;
select concat(first_name," ", last_name) as full_name from employees where last_name like 'E%'or last_name like "%E";

select upper(concat(first_name," ", last_name)) as full_name from employees where last_name like 'E%'or last_name like "%E";

select datediff(curdate(), hire_date) from employees where birth_date like "%-12-25" and hire_date > "1990" and hire_date < "2000";

select max(salary), min(salary) from salaries;
use employees;

select concat(lower(substr(first_name,1,1)), substr(lower(last_name), 1, 4), '_', substr(birth_date, 6, 2), substr(birth_date, 3,2)) from employees;