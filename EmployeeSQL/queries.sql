--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT * from employees; 

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date from Employees
WHERE hire_date >= '1985-12-31'
AND hire_date < '1987-01-01';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT Dept_Manager.dept_no, 
	   Departments.dept_name,
	   Dept_Manager.emp_no,
	   Employees.last_name,
	   Employees.first_name
FROM Dept_Manager
INNER JOIN Departments ON
Dept_Manager.dept_no = Departments.dept_no
INNER JOIN Employees ON
Dept_Manager.emp_no = Employees.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT Employees.emp_no, 
	   Employees.last_name, 
	   Employees.first_name,
	   Departments.dept_name
FROM Employees
INNER JOIN Dept_Manager ON
Employees.emp_no = Dept_Manager.emp_no
INNER JOIN Departments ON
Dept_Manager.dept_no = Departments.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT Employees.last_name, 
	   Employees.first_name,
	   Employees.sex
FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
left join departments on dept_emp.dept_name = departments.dept_no
left join employees on employees.emp_no = dept_emp.emp_no
where departments.dept_name='Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
left join departments on dept_emp.dept_name = departments.dept_no
left join employees on employees.emp_no = dept_emp.emp_no
where departments.dept_name='Sales' or departments.dept_name='Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM Employees
GROUP BY last_name
ORDER BY count(last_name) desc;