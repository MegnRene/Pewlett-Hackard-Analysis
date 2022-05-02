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

select * from retirement_titles;


SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO u_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;

select * from u_titles

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM u_titles as ut
GROUP BY ut.title
ORDER BY count DESC;



select * from retiring_titles