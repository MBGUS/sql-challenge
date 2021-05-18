-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
-- With SELECT function we declare the main variables for our table.
-- TIP: Table & . & Column, example: employees.emp_no
-- Requiered a Join to get the "salary" data, using the PK emp_no.  Check ERD Diagram.

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
-- As the information is from many tables, we use JOIN to get the information back. Check ERD Diagram.

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
-- As the information is from many tables, we use JOIN to get the information back. Check ERD Diagram.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- Using "WHERE" to filter and specific information, in this case, first name= "Hercules".
-- Using "LIKE" & "%" to find results which last name begins with "B".

SELECT first_name, last_name, sex
FROM employees
WHERE
first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- As the information is from many tables, we use JOIN to get the information back. Check ERD Diagram.
-- Using "WHERE" to filter and specific information, in this case, employees in Sales Department. 

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
-- As the information is from many tables, we use JOIN to get the information back. Check ERD Diagram.
-- In this case use "OR", which is an inclusive parameter to find people in Sales or Development.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE
departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- Using the function "COUNT" to sum all the iteration, and creating a new column using "AS".
-- Using "GROUPBY" to reduce the data result just to these two variables (last name & frequency)
-- Using "ORDER BY ... DESC" to order the data from largest to smallest.

SELECT last_name, COUNT (last_name) AS "Freq_Last_Name"
FROM employees
GROUP BY last_name
ORDER BY "Freq_Last_Name" DESC;


