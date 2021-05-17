-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

-- With SELECT function we declare the main variables for our table.
-- TIP: Table & . & Column, example: employees.emp_no
-- Requiered a Join to get the "salary" data, using the PK emp_no. 

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
-- Variables in "employees" table
-- Using "WHERE" to filter and specific information, in this case, data from 1986.

SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' and hire_date <= '1986-12-31';

-- 3.List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
-- As the information is from many tables, we use JOIN to get the information back.

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no;