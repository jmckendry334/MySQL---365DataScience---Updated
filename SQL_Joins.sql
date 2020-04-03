															#JOINS
use employees;

##Inner Join Dept_manager_dup as M and departments_dup as D-- dept_no, emp_no, dept_name
Select M.dept_no, M. emp_no, D.dept_name 
From dept_manager_dup M 
Join departments_dup D ON M.dept_no = D.dept_no;

## Join and Where used together -- employees and salaries: E.no & E.Name join S.salary >145K
use employees;
select E.emp_no, E.first_name, E.last_name, S.salary
from employees E
join salaries S on E.emp_no = S.emp_no
where S.salary > '145000'; 

##Cross Joins all department managers and where they can be assigned
Select DM.*, D.*
From dept_manager DM Cross Join departments D;

## Joings and agregate functions -- Average Salary of Men and Women using empl and salaries group by gender
Select e.gender, avg(s.salary) as average_salary
from employees e
join salaries s on e.emp_no = s.emp_no
group by gender;

## How many male and how many female managers do we have in the ‘employees’ database?
select e.gender, count(d.emp_no)
from employees E
join dept_manager D on e.emp_no = d.emp_no
group by gender;

##Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
select DM.emp_no, DM.dept_no, E.hire_date, E.first_name, E.last_name
from dept_manager DM
Join employees E on DM.emp_no = E.emp_no;

##Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch
## Create an output containing information corresponding to the following fields:
#‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.
select
e.emp_no,
e.first_name,
e.last_name,
d.dept_no,
d.from_date
from employees e
left join dept_manager d on e.emp_no = d.emp_no
Where e.last_name = 'Markovitch'
ORDER BY d.dept_no DESC, e.emp_no;

##Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date
Select
dm.emp_no,
dm.dept_no,
e.first_name,
e.last_name,
e.hire_date
From dept_manager dm
join employees e on dm.emp_no =e.emp_no;

##Select the first and last name, the hire date, and the job title of all employees whose 
##first name is “Margareta” and have the last name “Markovitch”.
select
e.first_name,
e.last_name,
e.hire_date,
t.title
from employees e
join titles t on e.emp_no = t.emp_no
where e.first_name = 'Margareta' and e.last_name = 'Markovitch';

##Select all managers’ first and last name, hire date, job title, start date, and department name - Joining multiple tables
select
e.first_name,
e.last_name,
dm.dept_no,
t.title,
t.from_date
from employees e
join dept_manager dm on e.emp_no = dm.emp_no
join departments d on dm.dept_no = d.dept_no
join titles t on e.emp_no = t.emp_no
where title = 'manager';


## Min Salary and Job Title from contract after 1-1-97
select 
MIN(salary) as Pay,
t.title as Job,
e.first_name,
e.last_name
from salaries s
join titles t on s.emp_no = t.emp_no
join employees e on s.emp_no = e.emp_no
where s.from_date > '2000-01-01';





