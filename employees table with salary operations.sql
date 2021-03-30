create database if not exists demo;

use demo;

drop table if exists employees;

CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(64) DEFAULT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `department` varchar(64) DEFAULT NULL,
  `salary` DECIMAL(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO `employees` (`id`,`last_name`,`first_name`,`email`, `department`, `salary`) VALUES (1,'Doe','John','john.doe@foo.com', 'HR', 55000.00);
INSERT INTO `employees` (`id`,`last_name`,`first_name`,`email`, `department`, `salary`) VALUES (2,'Public','Mary','mary.public@foo.com', 'Engineering', 75000.00);
INSERT INTO `employees` (`id`,`last_name`,`first_name`,`email`, `department`, `salary`) VALUES (3,'Queue','Susan','susan.queue@foo.com', 'Legal', 130000.00);

INSERT INTO `employees` (`id`,`last_name`,`first_name`,`email`, `department`, `salary`) VALUES (4,'Williams','David','david.williams@foo.com', 'HR', 120000.00);
INSERT INTO `employees` (`id`,`last_name`,`first_name`,`email`, `department`, `salary`) VALUES (5,'Johnson','Lisa','lisa.johnson@foo.com', 'Engineering', 50000.00);
INSERT INTO `employees` (`id`,`last_name`,`first_name`,`email`, `department`, `salary`) VALUES (6,'Smith','Paul','paul.smith@foo.com', 'Legal', 100000.00);

INSERT INTO `employees` (`id`,`last_name`,`first_name`,`email`, `department`, `salary`) VALUES (7,'Adams','Carl','carl.adams@foo.com', 'HR', 50000.00);
INSERT INTO `employees` (`id`,`last_name`,`first_name`,`email`, `department`, `salary`) VALUES (8,'Brown','Bill','bill.brown@foo.com', 'Engineering', 50000.00);
INSERT INTO `employees` (`id`,`last_name`,`first_name`,`email`, `department`, `salary`) VALUES (9,'Thomas','Susan','susan.thomas@foo.com', 'Legal', 80000.00);

INSERT INTO `employees` (`id`,`last_name`,`first_name`,`email`, `department`, `salary`) VALUES (10,'Davis','John','john.davis@foo.com', 'HR', 45000.00);
INSERT INTO `employees` (`id`,`last_name`,`first_name`,`email`, `department`, `salary`) VALUES (11,'Fowler','Mary','mary.fowler@foo.com', 'Engineering', 65000.00);
INSERT INTO `employees` (`id`,`last_name`,`first_name`,`email`, `department`, `salary`) VALUES (12,'Waters','David','david.waters@foo.com', 'Legal', 90000.00);

select * from employees order by salary desc;

#to find 2nd highest salary.
# select max(salary) from employees where salary not in(select max(salary) from employees );

#to find 3rd highest salary.
-- select * from employees order by salary desc limit 2,1;

# finding 3rd highest salary using dense_rank()
# create or replace view sal as (select salary, dense_rank() over(order by salary desc) as r from employees); 
# select * from sal where r=3;

#best way to find the nth highest salary by just replacing 3 by n.
# SELECT * FROM employees e1 WHERE 5-1 = (SELECT COUNT(DISTINCT salary) FROM employees e2 WHERE e2.salary > e1.salary);

-- SELECT upper(first_name), lcase(last_name)  FROM employees where salary = 50000;

#---------------------------------------------------------procedures---------------------------------------------------
drop procedure if exists max_salary_employee;

DELIMITER //

create procedure max_salary_employee (in sal int, out slr decimal)
begin

declare var varchar(20);
insert into employees value(13,'Anwar','Saeed','saeed.anwar@foo.com','Engineering',125000.00);


#best way to find the nth highest salary by hust replacing 3 by n.
SELECT salary into slr FROM employees e1 WHERE sal-1 = (SELECT COUNT(DISTINCT salary) FROM employees e2 WHERE e2.salary > e1.salary);


set var=12*slr;
select var; 
select * from employees order by salary desc;
end //

delimiter ;
set @slr=0.0;
call max_salary_employee(3, @slr );

SELECT "Third highest salary is: ",@slr;


-- -----------------------------------------------------Functions & If else ---------------------------------------------------- 
drop function if exists IncomeLevel;
delimiter //
create function IncomeLevel(monthly_income decimal)
returns varchar(20)
deterministic
begin

declare var varchar(20);

if monthly_income <= 30000 then
set var="low Income";

elseif monthly_income > 30000 and monthly_income < 80000 then 
set var="Avg Income";

else set var="High Income";

end if;

return var;

end //
delimiter ;


select first_name, last_name, IncomeLevel(salary)
from employees
order by first_name;

-- show databases;
-- show table status;
-- show function status where db="demo";
-- show procedure status where db="demo";
-- ----------------------------------------------------------------------------------------------------------------- 

select salary, count(1) from employees group by salary;
-- count(1) and count(*) gives the same output. Only difference is that count(*) considers all columns but count(1) only considers one column
-- and hence count(1) is faster than count(*) but by only fraction of a second.

select 'anything' from employees;

