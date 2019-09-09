CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, departments.dept_no, departments.dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

select * from employees_with_departments;


CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, departments.dept_no, departments.dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

select * from employees_with_departments;

alter table employees_with_departments add full_name varchar(31);
update employees_with_departments set full_name = concat(first_name, ' ', last_name);
alter table employees_with_departments drop column last_name;
alter table employees_with_departments drop column first_name;

/* .d perhaps, though no substantive information able to be rendered at this time  */

create temporary table 

alter table payments add cent_amount int unsiged 

update payments set cent_amount = amount * 100



 
describe employees.dept_manager;
describe employees.salaries;

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT concat(first_name, " ", last_name) as full_name, sal.salary, avg.sal from employees.employees as employee
join employees.dept_manager as manager
on manager.emp_no = employee.emp_no
join employees.salaries as sal
on sal.emp_no = employee.emp_no
where employee.emp_no in(select emp_no from employees.salaries where salary < (select avg(salary) from employees.salaries)) and manager.to_date = '9999-01-01' and sal.to_date = '9999-01-01' ;

select*from employees_with_departments;

drop table employees_with_departments;
((***describe employees.dept_manager;
describe employees.salaries;


SELECT concat(first_name, " ", last_name) as full_name, sal.salary from employees as employee
join dept_manager as manager
on manager.emp_no = employee.emp_no
join salaries as sal
on sal.emp_no = employee.emp_no
where employee.emp_no in(select emp_no from salaries where salary < (select avg(salary) from employees.salaries)) and manager.to_date = '9999-01-01' and sal.to_date = '9999-01-01';
***))
***SELECT concat(first_name, " ", last_name) as full_name, substring(avg(sal.salary),1,5) as current_sal, substring(avg(salary),1,5) as average_salary from employees as employee
join dept_emp as depte
on depte.emp_no = employee.emp_no
join salaries as sal
on sal.emp_no = employee.emp_no
left join dept_manager as manager
on manager.emp_no = employee.emp_no
where employee.emp_no in(select emp_no from salaries where salary < (select avg(salary) from salaries)) and depte.to_date = '9999-01-01' as avg_sal
join (select avg(salary) from salaries group by depte) group by full_name****

__________________________________________________


describe countrylanguage;
describe city;
describe country;

select city.name,language, percentage from country as cou
join countrylanguage as coulan
on cou.code = coulan.countrycode
join city as city
on city.countrycode = cou.code
where city.name = "Santa Monica"
order by percentage

__________________________________________________

use world;
describe countrylanguage;
describe city;
describe country;

select region as Region, count(name) as num_countries from country
group by region
order by count(*)

use world;
describe countrylanguage;
describe city;
describe country;

__________________________________________________

select region, sum(population) as population from country
group by region
order by population desc

__________________________________________________


select continent, sum(population) as population from country
group by continent
order by population desc

__________________________________________________

select avg(lifeexpectancy) from country

__________________________________________________

select continent, avg(lifeexpectancy) as avg_life from country
group by continent
order by avg_life; 

select region, avg(lifeexpectancy) as avg_life from country
group by region
order by avg_life;

__________________________________________________

select name as offical_name, localname as local_name from country
where name != localname
order by name

__________________________________________________


select name as country_name, avg(lifeexpectancy) < 50 as life_expect from country
group by country_name
order by avg(lifeexpectancy)
**************************************************
__________________________________________________

select name, district from city
where name = "San Antonio"

__________________________________________________

select city.name as City, district as State, cou.name as Country from city
join country as cou
on cou.code = city.countrycode
where city.name = "San Antonio"

__________________________________________________

select city.name as City, district as State, cou.name as Country, substring(lifeexpectancy,1,2) as "Life Expectancy" from city
join country as cou
on cou.code = city.countrycode
where city.name = "San Antonio"

__________________________________________________

select lower(concat(first_name, " ", last_name)) from actor

__________________________________________________

select actor_id, concat(first_name, " ", last_name) from actor
where first_name = "Joe"

__________________________________________________

select concat(first_name, " ", last_name) from actor
where last_name like "%gen%"

__________________________________________________

select first_name, last_name from actor
where last_name like "%il%"
order by last_name, first_name

__________________________________________________

select country_id, country from country 
where country in ("China", "Afghanistan", "Bangladesh")

__________________________________________________

select last_name, count(last_name) from actor
group by last_name
order by count(last_name) desc

__________________________________________________

select last_name as full_name, count(last_name) from actor 
group by last_name having count(*) > 2
order by count(last_name) desc

__________________________________________________

describe address;

__________________________________________________

select concat(first_name, ' ', last_name), concat(address,", ", city) as address from staff_list
join staff
on staff.staff_id = staff_list.ID

__________________________________________________

select concat(first_name, " ", last_name) as full_name, sum(amount) from payment
join staff
on staff.staff_id = payment.staff_id
where payment_date like "2005-08%"
group by full_name

__________________________________________________

select title, length(actors) - length(replace(actors, ',','')) + 1 from film_list

__________________________________________________

select title, count(inventory.film_id) from inventory
join film
on film.film_id = inventory.film_id
where title = "Hunchback Impossible"

__________________________________________________

select title from film
where language_id in (select language_id from language where name = "English" ) and title like "K%" or title like "Q%"

__________________________________________________

select * from 
(select title, concat(first_name, " ", last_name) as full_name from film
join film_actor 
on film_actor.film_id = film.film_id
join film_actor as fm
on fm.film_id = film.film_id
join actor
on actor.actor_id = fm.actor_id 
where title = "Alone Trip" group by full_name) as title

__________________________________________________


