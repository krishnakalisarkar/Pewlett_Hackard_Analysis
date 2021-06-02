-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;

--DELIVERABLE 1: Retiring employees by title.
SELECT * FROM employees;
SELECT * FROM titles;
-- Joining employees and titles tables with alias
DROP TABLE retirement_titles;
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
SELECT * FROM retirement_titles;
-- Select from retirement_titles:
SELECT rt.emp_no,
	   rt.first_name,
	   rt.last_name,
	   rt.title
FROM retirement_titles as rt;
SELECT DISTINCT ON (emp_no)emp_no,
					first_name,
					last_name,
					title
INTO Unique_Titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;
SELECT * FROM Unique_Titles;
--Number of titles from unique_titles
SELECT COUNT(UT.title) AS count,UT.title AS title	
INTO retiring_titles
FROM Unique_Titles as UT
GROUP BY UT.title
ORDER BY count DESC;
SELECT * FROM retiring_titles;
--End of Deliverable 1.