DROP TABLE dept_emp CASCADE;

CREATE TABLE titles(
  emp_no INT NOT NULL,
  title VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no, title, from_date)
);

 CREATE TABLE salaries (
 	emp_no INT NOT NULL, 
 	salary INT NOT NULL, 
 	from_date DATE NOT NULL,
 	to_date DATE NOT NULL, 
 FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
 PRIMARY KEY (emp_no, salary)
 );
 
 CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL, 
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
FOREIGN KEY (dept_no) REFERENCES departments (dept_no), 
	PRIMARY KEY (emp_no, dept_no, from_date)
);

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL, 
emp_no INT NOT NULL, 
from_date DATE NOT NULL, 
to_date DATE NOT NULL, 
FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
FOREIGN KEY (dept_no) REFERENCES departments (dept_no), 
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--Determine retirement elgibilty 
--FROM 1952-55
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
--IN 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31'

--IN 1953
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31'

-- IN 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31'

-- IN 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31'


SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--created new table and saved into csv file
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;
