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





 
