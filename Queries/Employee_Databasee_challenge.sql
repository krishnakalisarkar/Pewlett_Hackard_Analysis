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

--DELIVERABLE 2: The Employees Eligible for Mentorship Program.
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	   e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   t.title
INTO mentorship_eligibility
FROM employees as e	
INNER JOIN department_employees as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
SELECT * FROM mentorship_eligibility
--End of Deliverable 2.

--Number of titles from mentorship_eligibility
SELECT COUNT(me.title) AS count,me.title AS title
INTO mentorship_titles
FROM mentorship_eligibility as me
GROUP BY me.title
ORDER BY count DESC;
SELECT * FROM mentorship_titles;
--Additional quaries:
--Count of employees retiring based on gender.
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	   e.first_name,
	   e.last_name,
	   e.birth_date,
	   e.gender,
	   de.from_date,
	   de.to_date,
	   t.title
INTO retirement_gender
FROM employees as e	
INNER JOIN department_employees as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
SELECT * FROM retirement_gender;
--Count retiring employees by gender
SELECT COUNT(rg.gender) AS count,rg.gender
INTO retirement_gendercount
FROM retirement_gender as rg
GROUP BY rg.gender
ORDER BY count DESC;
SELECT * FROM retirement_gendercount;
--Retiring employees grouped by gender and title:
SELECT COUNT(rg.gender) AS count,rg.gender,rg.title
INTO gender_title
FROM retirement_gender as rg
GROUP BY rg.gender,rg.title
ORDER BY rg.gender DESC;
SELECT * FROM gender_title;
--END of additional queries.