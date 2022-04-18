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

DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
--not all employees would be active
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;


-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;


--shortening code with alias's
SELECT ri.emp_no,
   	   ri.first_name,
       ri.last_name,
       de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;



SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

--CREATING A NEW TABLE OF CURRENT_EMP_BY_DEPT to show the possible ppl that are retiring by dept (count)
-- Employee count by department number USING GROUP BY AND ORDER BY AND COUNT
SELECT COUNT(ce.emp_no), de.dept_no
INTO current_emp_by_dept --here we are creating a new table
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no

SELECT * FROM current_emp_by_dept;

