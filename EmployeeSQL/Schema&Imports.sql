-- For each table identify the variables:
-- a) Type: (varchar(lenght of text) / integer / date), 
-- b) Key: (primary (main key) / foreign (second variable related))

-- Tip FK (Foreign Key): when define use FOREING KEY (variable within main table) REFERENCE secondary_table (variable secondary)

-- DO NOT FORGET ";" at the end of each table / code.

-- In case there is an error on tables we use "DROP TABLE IF EXIST" to reuse the table.

-- DROP TABLES

DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

-- TABLE CREATION: 
-- Must be created in order according to linked variables (not able to have FK if there are not previously defined).

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT
);

CREATE TABLE departments (
	dept_no VARCHAR(50) PRIMARY KEY,
	dept_name VARCHAR(50)
);

CREATE TABLE titles (
	title_id VARCHAR(50),
	title VARCHAR(50),
	PRIMARY KEY (title_id)
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR(50),
	birth_date DATE,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	sex VARCHAR(50),
	hire_date DATE,
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(50),
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(50),
	emp_no INT,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
