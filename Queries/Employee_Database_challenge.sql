
--Deliverable one
SELECT 	e.emp_no,
		e.first_name, 
		e.last_name, 
	    ti.title, 
	    ti.from_date, 
	    ti.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO u_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM u_titles

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM u_titles AS ut
GROUP BY ut.title
ORDER BY COUNT DESC;



SELECT * FROM retiring_titles

--Deliverable two
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility 
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date  = '9999-01-01')  
ORDER BY e.emp_no, to_date DESC;  
SELECT * FROM mentorship_eligibility