-- 데이터 베이스 구축하기 
CREATE DATABASE school;
-- 어떤 데이터베이스를 사용하겠다.  
use school;

-- 테이블 생성 

-- 1. 학생 테이블 
CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL, 
    grade INT NOT NULL, 
    major VARCHAR(50) NOT NULL, 
    phone VARCHAR(20)
);

select * from student;

-- 2. 과목 테이블 
CREATE TABLE subject(
	subject_id INT PRIMARY KEY, 
    subject_name VARCHAR(50) NOT NULL, 
    credit INT NOT NULL, 
    professor VARCHAR(30) NOT NULL
);

-- 수강 테이블 (student 테이블 subject 테이블 연결) -> FK 
CREATE TABLE enrollment(
	enrollment_id INT PRIMARY KEY, 
    student_id INT NOT NULL, -- 일적으로 FK를 선언시 not null로 설정 함 
	subject_id int not null,
    score      DEcIMAL(5, 2), -- 5글자,소수점2자리까지
    enrolLED_AT DATe NOt null, 
    foreIGN kEY(student_id) REFERENcES Student(student_id),
    foreigN key(subject_id) REFERENcES Subject(subject_id)
);

-- 테이블 목록 확인 
show tables;