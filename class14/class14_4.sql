use employees;

-- 문제 

select * from salaries where salary= '158220';
select * from employees; -- where hire_date= '9999-01-01';
select * from titles;
select * from salaries;

select
	emp.emp_no,
	emp.first_name,
	emp.last_name,
	emp.gender,
	s.salary,
    t.title
from employees emp
left join salaries s ON emp.emp_no = s.emp_no  
left join titles t ON emp.emp_no = t.emp_no
-- where s.to_date= '9999-01-01'
order by salary desc
limit 1;
