use employees;
show tables;

-- employees DB를 이용하여 연관없는 테이블 2개를 이용해 행곱셉을 만들어보세요

select * from salaries;
select * from titles;

select 
	t.emp_no,
    t.title
from titles t 
join salaries s on t.emp_no = s.emp_no;

-- 문제1 모든 사원의 급여 총합, 평균급여, 최고급여,최저급여를 한꺼번에 출력하고
-- 사원들의 성별(gender)과 고요일(hire_date)두 칼럼을 조합하여 중복 없는 데이터를 출력하시오
-- (select 각각 쓰기)
select * from salaries;
-- 문제1.1
select 
	sum(s.salary) as '급여 총합',
    avg(s.salary) as '평균 급여',
    max(s.salary) as '최고 급여',
    min(s.salary) as '최저 급여'
from salaries s ;
-- 문제1.2
select * from employees;
select distinct
	gender,
    hire_date
from employees;

-- 문제2 
-- DB : [employees] "first_name 의 첫글자를 A,B, ... Z 순서로 그룹화 하시오."
select distinct
	first_name
from employees
group by first_name
order by first_name asc;

-- 문제3 
--  library DB에서 학생들이 빌린 도서에 리뷰를 보고자 한다
-- 리뷰를 달지 않은 학생도 출력되어야 함
-- 출력: 학번, 학생이름, 책제목, 리뷰
use library;
select * from book;
select * from borrow;
select * from review;
select * from student;

select 
	s.id as 학번,
    s.name 학생이름,
    b.title as 책제목,
	rv.star as 리뷰
from student s 
join borrow br on s.id = br.student_id
left join book b on b.id = br.book_id
left join review rv on s.id = rv.student_id and rv.book_id = b.id;


