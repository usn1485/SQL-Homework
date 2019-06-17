--Select Queries
Select * from employees;
Select * from departments;
Select * from dept_emp;
Select * from dept_manager;
Select * from salaries;
Select * from titles;

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
--SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
--FROM Orders
--INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

Select e.emp_no, e.last_name, e.first_name, e.gender, s.salary from employees as e
INNER JOIN  salaries as s ON s.emp_no=e.emp_no;



--2. List employees who were hired in 1986.

select emp_no, first_name, last_name, hire_date from employees
where hire_date between '1986-01-01' AND '1987-01-01';

--3. List the manager of each department with the following information: department number, department name,
--the manager's employee number, last name, first name, and start and end employment dates.

Select d.dept_no, d.dept_name,e.emp_no, e.last_name, e.first_name,dm.from_date, dm.to_date from employees as e
INNER JOIN  dept_manager as dm ON dm.emp_no=e.emp_no
INNER JOIN departments as d on dm.dept_no = d.dept_no ;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select de.emp_no,e.last_name, e.first_name, d.dept_name from employees as e
INNER JOIN dept_emp as de ON de.emp_no=e.emp_no
INNER JOIN departments as d on de.dept_no = d.dept_no ;

--5. List all employees whose first name is "Hercules" and last names begin with "B."

select e.first_name, e.last_name from employees as e where e.first_name = 'Hercules' AND e.last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no,e.last_name, e.first_name, d.dept_name from employees as e 
INNER JOIN dept_emp as de ON de.emp_no=e.emp_no
INNER JOIN departments as d on de.dept_no = d.dept_no where dept_name='Sales';

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

select e.emp_no,e.last_name, e.first_name, d.dept_name from employees as e 
INNER JOIN dept_emp as de ON de.emp_no=e.emp_no
INNER JOIN departments as d on de.dept_no = d.dept_no where dept_name IN ('Sales','Development') ;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name,count(last_name) as "Last Name count" from employees 
group by last_name 
order by  "Last Name count" desc;


