-- 테이블 복사 쿼리 만들어 보기 
use employees;
drop table tb_departments;
-- delete from tb_employees;

-- 기존에 데이터를 테스트할 때 값을 수시로 변경하면 상용 서비스에 문제 발생 가능성이 높아짐
-- 테스트를 먼저 하기 위해 테이블 복사를 하고 여기서 테스트를 진행을 한다.

-- 테이블 복사 시 구조만 복사 

create table tb_employees
as select * from employees where 1 = 0;

-- 테이블 복사 시 구조 + 데이터까지

create table tb_employees
as select * from employees;

create table tb_departments
as select * from departments;

-- 1일1쿼리 (하루에 1개씩 직접 문제를 분석하여 만들고 풀기)


select * from employees;
select * from tb_departments;

-- 1. employees DB 각 테이블이 어떤 의미인지 파악
-- 2. 스스로 배운거에 있어 문제를 직접 만들어서 공유 (디스코드 공유에 올려 주세요)
-- 퇴직 날짜가 1999-05-24일 직원을 조회하시오 
select * from tb_employees where departments  = 'development';