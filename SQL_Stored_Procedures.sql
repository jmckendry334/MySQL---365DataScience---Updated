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


