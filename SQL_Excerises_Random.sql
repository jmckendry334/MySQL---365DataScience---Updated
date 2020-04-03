use employees;
#Random Excerises

## Min Salary and Job Title from contract after 1-1-97
select 
MIN(salary) as Pay,
t.title as Job,
e.first_name,
e.last_name
from salaries s
join titles t on s.emp_no = t.emp_no
join employees e on s.emp_no = e.emp_no
where s.from_date > '1997-01-01';


#Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000. #WHERE AND HAVING
select emp_no
from dept_emp
where from_date > '2000-01-01'
group by emp_no
having count(emp_no) > 1;

##What is the average annual salary paid to employees who started after the 1st of January 1997?
select avg(salary)
from salaries
where from_date > '1997-01-01';
##Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.
select round(avg(salary),2)
from salaries
where from_date > '1997-01-01';
##Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
Select *
From employees
Where first_name IN('Denis', 'Elvis');


##Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
select *
FROM   employees
WHERE first_name LIKE ('%JACK%');


