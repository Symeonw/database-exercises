reate temporary table 

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


select email from customer
join customer_list as cl
on cl.id = customer.customer_id
where country = "Canada"

__________________________________________________

select title from category as cat
join film_category as filmcat
on filmcat.category_id = cat.category_id
join film
on film.film_id = filmcat.film_id
where name = "family"; 

__________________________________________________

select store, total_sales from sales_by_store;

__________________________________________________

select store_id,city, country from store
join address as addy
on addy.address_id = store.address_id
join city
on city.city_id = addy.city_id
join country
on country.country_id = city.country_id

__________________________________________________

select name, sum(amount) from category as cat
join film_category as fcat
on fcat.category_id = cat.category_id
join inventory as inv
on inv.film_id = fcat.film_id
join rental as rent
on rent.inventory_id = inv.inventory_id
join payment as pay
on pay.rental_id = rent.rental_id
group by name
order by sum(amount) desc limit 5

__________________________________________________

select * from actor;
Select last_name from actor;
select film_id, title, release_year from film;

__________________________________________________

select distinct last_name from actor;
select distinct postal_code from address;
select distinct rating from film;

__________________________________________________

select title, description, rating, length from film 
where length > 180;

select payment_id, amount, payment_date from payment 
where payment_date >= "2005-05-27";

select payment_id, amount, payment_date from payment
where payment_date = "2005-05-27";

describe customer;
 
select * from customer
where last_name like "S%" or first_name like "%N";

select * from customer 
where active = 0 and last_name like "M%";

select * from category
where category_id > 4 and name like "C%" or name like"S%" or name like "T%";

select staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update from staff;

select staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update from staff
where password is not null;

__________________________________________________

select phone, district from address
where district in ("California", "England", "Taipei", "West Java");

select payment_id, amount, payment_date from payment
where date(payment_date) in ( "2005-05-25", '2005-05-27','2005-05-29');

select * from film
where rating in ("G", "PG-13", "NC-17")

__________________________________________________

select * from payment
where payment_date between "2005-05-25 00:00:00" and "2005-05-26 23:59:59";

select * from film
where length between 100 and 120;

__________________________________________________

select * from film
where description like "A Thoughtful%";

select * from film
where description like "%Boat";

select * from film
where description like "%Database%";

__________________________________________________

select * from payment
limit 20;

select payment_date, amount from payment
where amount > 5 limit 1000 offset 999;

select * from customer
limit 99 offset 101;

__________________________________________________


select * from film
order by length;

select distinct rating from film
order by rating desc;

select payment_date, amount from payment
order by amount desc
limit 20;

select title, description, special_features, length, rental_duration from film
where length > 120 and special_features like "%Behind the%" and rental_duration between 5 and 7
order by length desc;

__________________________________________________

select customer.first_name as customer_first_name, customer.last_name as customer_last_name, actor.first_name as actor_first_name, actor.last_name as actor_last_name from customer
left join actor
on actor.last_name = customer.last_name;

select customer.first_name as customer_first_name, customer.last_name as customer_last_name, actor.first_name as actor_first_name, actor.last_name as actor_last_name from customer
join actor
on actor.last_name = customer.last_name;

select city.city, cou.country from city
left join country as cou
on cou.country_id = city.country_id;
describe language;
describe film;
select title, description, release_year, lang.name from film
left join language as lang
on lang.language_id = film.language_id;
describe city;
describe address;
select first_name,last_name, address, address2, city, district, postal_code from staff
left join address as addy
on addy.address_id = staff.address_id
left join city 
on city.city_id = addy.city_id

__________________________________________________

