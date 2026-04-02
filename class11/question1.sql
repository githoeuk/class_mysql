
use employees;

select * from employees; 
select * from employees where hire_date = '1999-05-24'; 
select * from salaries where to_date = '9999-01-01'; 

alter table salaries add column is_deleted booleanemployees default false;

update salaries
set is_deleted = True
where to_date = '9999-01-01'; 
