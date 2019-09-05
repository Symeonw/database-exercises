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
where manager.to_date = '9999-01-01'