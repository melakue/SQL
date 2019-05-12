--List the following details of each employee: employee number, last name, first name, gender, and salary.
select employees.emp_no,last_name,first_name,gender,salary from employees inner join salaries on employees.emp_no = salaries.emp_no;


--List employees who were hired in 1986.
select last_name,first_name from employees where (hire_date  between '1986-01-01' and '1986-12-31');


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dept_emp.dept_no, dept_name,dept_emp.emp_no, last_name, first_name, from_date,to_date 
from dept_emp 
inner join employees on employees.emp_no = dept_emp.emp_no 
inner join departments on departments.dept_no= dept_emp.dept_no; 


--List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no, last_name,first_name, dept_name 
from employees 
inner join dept_emp on employees.emp_no=dept_emp.emp_no
inner join departments on dept_emp.dept_no=departments.dept_no;


--List all employees whose first name is "Hercules" and last names begin with "B."
select last_name,first_name from employees where first_name like 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.


select emp_no,last_name,first_name from employees 
where emp_no in (select emp_no from dept_emp where dept_no = (select dept_no from departments where dept_name = 'Sales'));



--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name

select emp_no,last_name,first_name from employees 
where emp_no in (select emp_no from dept_emp where dept_no in (select dept_no from departments where dept_name = 'Sales' or dept_name= 'Development'));



--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as Total from employees group by last_name order by total asc;

