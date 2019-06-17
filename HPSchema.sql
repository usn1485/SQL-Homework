CREATE TABLE employees(
emp_no  SERIAL PRIMARY KEY, 
birth_date DATE,
first_name VARCHAR(30) Not Null,
last_name VARCHAR(30) Not Null,
gender VARCHAR(10),
hire_date DATE
);


CREATE TABLE departments(
dept_no VARCHAR  PRIMARY KEY, 
dept_name VARCHAR(30) Not Null
);

CREATE TABLE Salaries(
emp_no INTEGER NOT NULL, 
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
salary INTEGER NOT NULL,
from_date DATE, 
to_date DATE
);

CREATE TABLE Titles(
emp_no INTEGER NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
title VARCHAR(30) Not Null,
from_date DATE, 
to_date DATE
);

-- Create a junction table.
CREATE TABLE dept_manager (
  dept_no VARCHAR NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  PRIMARY KEY (dept_no, emp_no),
  from_date DATE, 
  to_date DATE
);

-- Create a junction table.


CREATE TABLE dept_emp (
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  dept_no VARCHAR NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  PRIMARY KEY (dept_no, emp_no),
  from_date DATE, 
  to_date DATE
);






