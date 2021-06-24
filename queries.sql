DROP VIEW ALL_IN_ONE_TABLE

CREATE VIEW ALL_IN_ONE_TABLE AS
	(SELECT DISTINCT EMPLOYEES.EMP_NO,
			EMP_TITLE_ID,
			TITLES.TITLE,
			BIRTH_DATE,
			FIRST_NAME,
			LAST_NAME,
			SEX,
			HIRE_DATE,
			DEPT_EMP.DEPT_NO,
			DEPARTMENTS.DEPT_NAME,
			SALARIES.SALARY
		FROM EMPLOYEES
		INNER JOIN SALARIES ON SALARIES.EMP_NO = EMPLOYEES.EMP_NO
		INNER JOIN DEPT_EMP ON DEPT_EMP.EMP_NO = SALARIES.EMP_NO
		INNER JOIN DEPARTMENTS ON DEPARTMENTS.DEPT_NO = DEPT_EMP.DEPT_NO
		INNER JOIN TITLES ON TITLES.TITLE_ID = EMPLOYEES.EMP_TITLE_ID) 

-- Convert VIEW to a TABLE
CREATE TABLE merged_data AS SELECT * FROM ALL_IN_ONE_TABLE;

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT EMP_NO,
	LAST_NAME,
	FIRST_NAME,
	SEX,
	SALARY
FROM ALL_IN_ONE_TABLE
ORDER BY EMP_NO 

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT DISTINCT FIRST_NAME,
	LAST_NAME,
	HIRE_DATE
FROM ALL_IN_ONE_TABLE
WHERE HIRE_DATE >= '1986-01-01'
	AND HIRE_DATE < '1987-01-01'
ORDER BY LAST_NAME,
	FIRST_NAME 
	
-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT DISTINCT DEPT_EMP.DEPT_NO, 
	DEPARTMENTS.DEPT_NAME, 
	EMPLOYEES.EMP_NO, 
	LAST_NAME, 
	FIRST_NAME
FROM EMPLOYEES
INNER JOIN SALARIES ON SALARIES.EMP_NO = EMPLOYEES.EMP_NO 
INNER JOIN DEPT_EMP ON DEPT_EMP.EMP_NO = SALARIES.EMP_NO 
INNER JOIN DEPARTMENTS ON DEPARTMENTS.DEPT_NO = DEPT_EMP.DEPT_NO 
INNER JOIN TITLES ON TITLES.TITLE_ID = EMPLOYEES.EMP_TITLE_ID 
INNER JOIN DEPT_MANAGER ON DEPT_MANAGER.DEPT_NO = DEPT_EMP.DEPT_NO
AND DEPT_MANAGER.EMP_NO = EMPLOYEES.EMP_NO -- List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT DISTINCT EMP_NO, 
	LAST_NAME, 
	FIRST_NAME, 
	DEPT_NAME
FROM ALL_IN_ONE_TABLE 

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT FIRST_NAME, 
	LAST_NAME, 
	SEX
FROM ALL_IN_ONE_TABLE 
WHERE FIRST_NAME = 'Hercules'
	AND LAST_NAME Like 'A%' -- List all employees in the Sales department, including their employee number, last name, first name, and department name.

	SELECT EMP_NO, 
		LAST_NAME, 
		FIRST_NAME, 
		DEPT_NAME
	FROM ALL_IN_ONE_TABLE WHERE DEPT_NAME LIKE 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT DISTINCT EMP_NO,
	LAST_NAME,
	FIRST_NAME,
	DEPT_NAME
FROM ALL_IN_ONE_TABLE
WHERE DEPT_NAME IN ('Sales', 'Development')

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT LAST_NAME,
	COUNT(LAST_NAME) AS COUNT
FROM ALL_IN_ONE_TABLE
GROUP BY LAST_NAME
ORDER BY COUNT DESC

