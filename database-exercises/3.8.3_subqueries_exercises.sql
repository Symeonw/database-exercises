CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

select * from users,roles;

SELECT users.name as user_name, roles.name as role_name
FROM roles
JOIN users ON users.role_id = roles.id;
SELECT users.name as user_name, roles.name as role_name
FROM roles
LEFT JOIN users ON users.role_id = roles.id;
SELECT users.name as user_name, roles.name as role_name
FROM roles
RIGHT JOIN users ON users.role_id = roles.id
group by 

use employees;
describe departments;
describe current_dept_emp;
describe dept_manager;
describe employees;
select  dept.dept_name as "Department Name", concat(employee.first_name, " ", employee.last_name) as "Manager Name" from employees as employee
join dept_manager as manager
on manager.emp_no = employee.emp_no
join departments as dept
on dept.dept_no = manager.dept_no
where manager.to_date = '9999-01-01';

use employees;
describe departments;
describe current_dept_emp;
describe dept_manager;
describe employees;
select  dept.dept_name as "Department Name", concat(employee.first_name, " ", employee.last_name) as "Manager Name" from employees as employee
join dept_manager as manager
on manager.emp_no = employee.emp_no
join departments as dept
on dept.dept_no = manager.dept_no
where manager.to_date = '9999-01-01' and employee.gender = 'F';

use employees;
describe titles;
describe employees;
select * from departments;

use employees;
describe titles;
describe employees;
describe dept_emp;
describe departments;

select t.title as title, count(*) from employees as employee
join titles as t
on t.emp_no = employee.emp_no
join dept_emp as depte
on depte.emp_no = employee.emp_no
join departments as dept
on dept.dept_no = depte.dept_no
where dept.dept_name = "Customer Service" and t.to_date = '9999-01-01' and depte.to_date = '9999-01-01'
group by title;

describe salaries;
select * from salaries;
select  dept.dept_name as "Department Name", concat(employee.first_name, " ", employee.last_name) as "Manager Name", sal.salary from employees as employee
join dept_manager as manager
on manager.emp_no = employee.emp_no
join departments as dept
on dept.dept_no = manager.dept_no
join salaries as sal
on sal.emp_no = employee.emp_no
where manager.to_date = '9999-01-01' and sal.to_date = '9999-01-01';

describe departments;
describe dept_emp;
describe employees;

select dept.dept_no, dept.dept_name as dept_name, count(*) from employees as employee
join dept_emp as depte
on depte.emp_no = employee.emp_no
join departments as dept
on dept.dept_no = depte.dept_no
where depte.to_date = '9999-01-01'
group by dept.dept_no;

describe departments;
describe dept_emp;
describe employees;
describe salaries;

describe departments;
select dept.dept_name, avg(sal.salary) as salary 
from departments as dept
join dept_emp as depte
on depte.dept_no = dept.dept_no
join employees as employee
on employee.emp_no = depte.emp_no
join salaries as sal
on sal.emp_no = employee.emp_no
group by dept.dept_name
order by salary desc
limit 1;


describe departments;
describe dept_emp;
describe employees;
describe salaries;

select first_name, last_name from employees as employee
join dept_emp as depte
on depte.emp_no = employee.emp_no
join departments as dept
on dept.dept_no = depte.dept_no
join salaries as sal
on sal.emp_no = employee.emp_no
Where dept.dept_name = "Marketing" and depte.to_date = "9999-01-01" and sal.to_date = "9999-01-01"
order by sal.salary desc
limit 1; 