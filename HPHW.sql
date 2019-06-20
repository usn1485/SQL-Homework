--Select Queries
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;

--1. List the following details of each employee: employee number, lASt name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary FROM employees AS e
INNER JOIN  salaries AS s ON s.emp_no=e.emp_no;

--2. List employees who were hired in 1986.

SELECT emp_no, first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--3. List the manager of each department with the following information: department number, department name,
--the manager's employee number, lASt name, first name, and start and end employment dates.

SELECT d.dept_no, d.dept_name,e.emp_no, e.last_name, e.first_name,dm.FROM_date, dm.to_date FROM employees AS e
INNER JOIN  dept_manager AS dm ON dm.emp_no=e.emp_no
INNER JOIN departments AS d ON dm.dept_no = d.dept_no ;

--4. List the department of each employee with the following informatiON: 
--employee number, lASt name, first name, and department name.
SELECT de.emp_no,e.last_name, e.first_name, d.dept_name FROM employees AS e
INNER JOIN dept_emp AS de ON de.emp_no=e.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no ;

--5. List all employees whose first name is "Hercules" and lASt names begin with "B."

SELECT e.first_name, e.last_name FROM employees AS e WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, lASt name, first name, and department name.

SELECT e.emp_no,e.last_name, e.first_name, d.dept_name FROM employees AS e 
INNER JOIN dept_emp AS de ON de.emp_no=e.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no WHERE dept_name='Sales';

--7. List all employees in the Sales and Development departments, 
--including their employee number, lASt name, first name, and department name.

SELECT e.emp_no,e.last_name, e.first_name, d.dept_name FROM employees AS e 
INNER JOIN dept_emp AS de ON de.emp_no=e.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no WHERE dept_name IN ('Sales','Development') ;

--8. In descending order, list the frequency count of employee lASt names, i.e., how many employees share each lASt name.
SELECT last_name,COUNT(last_name) AS "Last Name count" FROM employees 
GROUP BY last_name 
ORDER BY  "Last Name count" DESC;


