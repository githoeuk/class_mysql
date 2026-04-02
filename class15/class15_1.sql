use employees;

-- join에 필터 걸기

show tables;

desc employees;
desc salaries;
desc titles;
desc departments;
desc dept_emp;
desc dept_manager;

-- 문제 1 
-- 현재 유효한 연봉 기준으로 연봉이 높은 순서대로 출력하세요 ( 이름 , 연봉 )

select * from salaries;
select * from employees;

select 
	e.emp_no,
    e.first_name,
    e.last_name,
    s.salary
from employees e
inner join salaries s ON e.emp_no = s.emp_no 
where s.to_date = '9999-01-01'
order by s.salary desc;

-- join 후 결과에서 where 절 작동 - 사후 필터 개념 

-- 문제 2
-- 현재 직원 목록 (사번 , 이름 , 연봉)

select 
	e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    s.salary
from employees e
join titles t on e.emp_no = t.emp_no and t.to_date = '9999-01-01'
join salaries s on e.emp_no = s.emp_no and s.to_date = '9999-01-01';

-- join 문법에서 ON 절 뒤에 AND를 붙여 join조건과 필터링을 한꺼번에 걸 수 있다. ---- (사전 필터) , (인라인 필터) , (공식 명칭 : join 조건)

-- 사후 필터 버전
select 
	e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    s.salary
from employees e
join titles t on e.emp_no = t.emp_no 
join salaries s on e.emp_no = s.emp_no 
where s.to_date = '9999-01-01'and t.to_date = '9999-01-01';

-- inner join 에서는 사전, 사후 필터의 결과 값이 동일하다.


-- 문제 3
-- 현재 부서 관리자(사번 ,이름(first_name) ,부서명 ,시작일) 
select * from employees;
select * From dept_manager; -- 중간 연결 역할 
select * From departments;

-- 필터 조건 
-- 한 사원이 여러 부서의 관리자가 될 수 있다.(희귀케이스)
-- 한 부서에는 시간의 흐름에 따라서 여려명의 사원이 거쳐갈 수 있다.

-- left join 사전필터링 사용 
select 
	e.emp_no,
    e.first_name
    -- d.dept_name,
    -- dm.from_date
from employees e
left join dept_manager dm on e.emp_no = dm.emp_no and dm.to_date = '9999-01-01';
-- inner join departments d on dm.dept_no = d.dept_no;

-- left join 사후 필터 사용
select 
	e.emp_no,
    e.first_name,
    d.dept_name,
    dm.from_date
from employees e
left join dept_manager dm on e.emp_no = dm.emp_no
inner join departments d on dm.dept_no = d.dept_no
where dm.to_date = '9999-01-01';

-- outer join(left join) 사용 시 사후 필터로 적용을 하게 되면
-- left join에 의미가 없어지게 된다, 즉 inner join 사용한거와 같아지게 된다.
-- 실무에서 90퍼센트 실수를 하는 부분이다.

-- 즉 아우터필터를 적용 시 사후 필터 - x , 사전 필터를 사용해야 아퉈 필터의 특징을 살림

-- 문제 4 
-- 여성 직원 중 1991년 이후 입사자 

select * from employees 
where hire_date > '1991-01-01' and gender = 'F'
order by hire_date asc;

-- 문제 5
-- Senior Engineer 중 고연봉자(직급 - 'Senior', 이름(first_name) - 'Ram', 연봉 - 100,000 이상)
-- 직원의 [사번 , 이름 , 연봉, 직급 ] 조회 

select * from employees;
select * from salaries;
select * from titles;

select 
	e.emp_no,
    e.first_name,
    s.salary,
    t.title
from employees e 
join salaries s on e.emp_no = s.emp_no 
join titles t on e.emp_no = t.emp_no 
where t.title = 'Senior Engineer'
and e.first_name like 'Ram%' 
and s.salary >= 100000
and t.to_date = '9999-01-01'
and s.to_date = '9999-01-01';

-- 실전문제 6
-- 특정 조건의 Senior Engineer 
-- first-name 'S'로 시작 , 직급 'Senior Engineer ' , 직급 종료일 '1999-01-01'
-- 직원의 [사번, 이름 , 지급 ,시작일, 종료일]

select * from employees;
select * from titles;

select 
	e.emp_no,
    e.first_name,
    t.title,
    t.to_date
from employees e
join titles t on e.emp_no = t.emp_no 
where e.first_name like 'S%' 
and t.title = 'Senior Engineer' 
and to_date <= '1999-01-01';

-- 문제 7
-- 1960년대 출생 여성 직원 조회(between 사용)
select * from employees 
where gender = 'F'
and birth_date between '1960-01-01' and '1969-12-31';

-- 문제8
-- 성이 J로 시작하는 직원 
select e.emp_no, e.first_name, e.last_name, s.salary
from employees e
join salaries s on e.emp_no = s.emp_no
where last_name like 'J%';

-- 문제 9
-- 컬럼명 한글로 변경 
-- 사원번호,성별,현재 연봉을 한글로 컬럼 변경,사원번호 10020이하인 직원만 오름차순 출력
select e.emp_no as 사원번호, e.gender as 성별 , s.salary as 연봉
from employees e
join salaries s on e.emp_no = s.emp_no
where e.emp_no <= 10020
and s.to_date = '9999-01-01'
order by e.emp_no asc;

-- 문제10
-- 현재 직원의 부서 소속 
select * from employees; 

select de.emp_no, e.first_name, t.title
from dept_emp de
join employees e on de.emp_no = e.emp_no
join titles t on de.emp_no = t.emp_no
where de.to_date = '9999-01-01';