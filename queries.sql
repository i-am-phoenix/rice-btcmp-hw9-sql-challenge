--DROP VIEW all_in_one_table

CREATE VIEW all_in_one_table as (
	SELECT DISTINCT employees.emp_no, emp_title_id, titles.title, birth_date, first_name, last_name, sex, hire_date, dept_emp.dept_no, departments.dept_name, salaries.salary FROM employees
	INNER JOIN salaries ON salaries.emp_no=employees.emp_no
		INNER JOIN dept_emp ON dept_emp.emp_no=salaries.emp_no
			INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
				INNER JOIN titles ON titles.title_id=employees.emp_title_id
)

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp_no, last_name, first_name, sex, salary 
FROM all_in_one_table ORDER BY emp_no

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT DISTINCT first_name, last_name, hire_date 
FROM all_in_one_table WHERE hire_date>='1986-01-01' and hire_date<'1987-01-01' ORDER BY last_name, first_name

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT DISTINCT dept_emp.dept_no, departments.dept_name, employees.emp_no, last_name, first_name FROM employees
INNER JOIN salaries ON salaries.emp_no=employees.emp_no
	INNER JOIN dept_emp ON dept_emp.emp_no=salaries.emp_no
		INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
			INNER JOIN titles ON titles.title_id=employees.emp_title_id
				INNER JOIN dept_manager ON dept_manager.dept_no=dept_emp.dept_no AND dept_manager.emp_no=employees.emp_no
				
				
-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT DISTINCT emp_no, last_name, first_name, dept_name FROM all_in_one_table

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM all_in_one_table
WHERE first_name='Hercules' AND last_name Like'A%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name FROM all_in_one_table
WHERE dept_name LIKE 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT DISTINCT emp_no, last_name, first_name, dept_name FROM all_in_one_table
WHERE dept_name IN ('Sales' ,'Development')

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) as count FROM all_in_one_table
GROUP BY last_name ORDER BY count DESC

