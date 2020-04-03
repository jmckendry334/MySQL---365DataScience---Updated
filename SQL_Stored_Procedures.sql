								##Stored Procedures
use employees;
delimiter $$
create procedure TESTing()
begin
select * from employees limit 1000;
end $$
delimiter ;
call Testing()
##Create a procedure that will provide the average salary of all employees.
delimiter $$
create procedure AVG_SAL()
begin 
Select 
AVG(salary)
from salaries;
end $$
call AVG_SAL()

##Create Procedure with an Input Paramater
drop procedure if exists A_SALARY;
delimiter $$
create procedure A_SALARY(IN p_emp_no INT)
begin
select 
e.first_name,
e.last_name,
AVG(s.salary),
s.from_date,
s.to_date
from
employees e 
join salaries s on e.emp_no = s.emp_no
where e.emp_no = p_emp_no;
end $$
delimiter ; 







