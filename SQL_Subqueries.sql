## SQL_Subqueries
##EXAMPLE - Select the first and last name from the 'Employees' table for the same employee numbers that can be found in the 'DepManager table
Select e.first_name, e.last_name
from employees e
where e.emp_no IN (select dm.emp_no
from dept_manager dm);

##Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.
select *
from dept_manager DM
where emp_no IN (select emp_no from employees where hire_date between '1990-01-01' and '1995-01-01');

##Select the entire information for all employees whose job title is “Assistant Engineer”.
select *
from employees E 
where emp_no in (select emp_no from titles where titles.title = 'Assistant Engineer');

##Extract the information about all department managers who salaries between 100k-150K
Select *
From Dept_manager DM
where emp_no in (Select emp_no from salaries where salaries.salary between '100000' and '150000');


