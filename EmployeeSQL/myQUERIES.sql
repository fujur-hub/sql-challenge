--1 List the following details of each employee: employee number, 
--last name, first name, gender, and salary.

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees AS e
	JOIN salaries AS s
	ON (e.emp_no = s.emp_no)
	GROUP BY e.emp_no, s.salary
	ORDER BY e.last_name;
	
--2 List employees who were hired in 1986.

SELECT e.first_name, e.last_name
FROM employees AS e
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, 
--and start and end employment dates.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date, s.salary
FROM department_manager AS dm
	JOIN department AS d
	ON (dm.dept_no=d.dept_no)
		JOIN employees AS e
		ON (dm.emp_no=e.emp_no)
			JOIN salaries AS s
			ON (dm.emp_no=s.emp_no);
--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp AS de
	ON (e.emp_no=de.emp_no)
		JOIN department AS d
		ON (de.dept_no=d.dept_no);

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name
FROM employees AS e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT * FROM department;
--d007

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp AS de
	ON (e.emp_no=de.emp_no)
		JOIN department AS d
		ON (de.dept_no=d.dept_no)
		WHERE d.dept_no = 'd007';

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name, d.dept_no
FROM employees AS e
	JOIN dept_emp AS de
	ON (e.emp_no=de.emp_no)
		JOIN department AS d
		ON (de.dept_no = d.dept_no)
		WHERE (d.dept_no = 'd007') OR (d.dept_no = 'd005');

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT COUNT (last_name) AS count,last_name
FROM employees
GROUP BY last_name
ORDER BY count DESC;

