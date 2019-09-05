use employees;
select distinct title from titles;
select distinct last_name
	 from employees where last_name like 'E%' and last_name like "%E" group by last_name;
select first_name, last_name from employees where last_name like 'E%' and last_name like "%E" group by first_name, last_name;
select last_name from employees where last_name like '%q%' and last_name not like "%qu%" group by last_name;
select count(*), last_name from employees where last_name like '%q%' and last_name not like "%qu%" group by last_name;

select gender, count(*) from employees where (first_name = 'Irena' or first_name ='Vidya' or first_name = 'Maya') group by gender;
select count(*) from(
select count(*) as username_count, concat(lower(substr(first_name,1,1)), substr(lower(last_name), 1, 4), '_', substr(birth_date, 6, 2), substr(birth_date, 3,2)) as username from employees group by username having username_count>1) as "count";

select concat(lower(substr(first_name,1,1)), substr(lower(last_name), 1, 4), '_', substr(birth_date, 6, 2), substr(birth_date, 3,2)) as username, count(*) from employees group by username order by count(*) desc;
