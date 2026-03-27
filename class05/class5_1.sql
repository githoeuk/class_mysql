-- DDL ( 구조를 만든다 ) 

-- 데이터베이스 생성 
DROP DATABASE school; -- 데이터베이스 삭제
CREATE DATABASE school; -- 데이터베이스 생성
use school;

-- 테이블 생성 
create table student(
	
    student_id int primary key,
    name varchar(50) not null,
    grade int not null,
    major varchar(50) not null,
    phone varchar(20)

);

-- 테이블 구조 확인 명령어 
desc student;

-- 테이블 생성된 이후에 추가로 컬럼을 넣고 싶다면?
ALTER TABLE student ADD COLUMN email varchar(100);

-- 컬럼 삭제 명령어 
ALTER TABLE student DROP COLUMN email;

-- 테이블 삭제 명령어 
-- drop table student;

-- 데이터베이스 삭제 명령어
-- DROP DATABASE student;



