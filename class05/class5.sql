-- -- 존재할 경우에만 삭제
DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

-- student 테이블 생성
CREATE TABLE student (
    student_id INT         PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    grade      INT         NOT NULL,
    major      VARCHAR(50) NOT NULL,
    phone      VARCHAR(20)
);

-- subject 테이블 생성
CREATE TABLE subject (
    subject_id   INT         PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    credit       INT         NOT NULL,
    professor    VARCHAR(30) NOT NULL
);

-- enrollment 테이블 생성
CREATE TABLE enrollment (
    enrollment_id INT          PRIMARY KEY,
    student_id    INT          NOT NULL,
    subject_id    INT          NOT NULL,
    score         DECIMAL(5,2),
    enrolled_at   DATE         NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

-- 데이터 입력
INSERT INTO student VALUES
(1001, '김철수', 2, '컴퓨터공학', '010-1234-5678'),
(1002, '이영희', 3, '경영학',     '010-2345-6789'),
(1003, '박민준', 1, '전자공학',   '010-3456-7890'),
(1004, '최지아', 4, '컴퓨터공학', '010-4567-8901'),
(1005, '한수연', 2, '경영학',     NULL);

INSERT INTO subject VALUES
(101, '데이터베이스', 3, '김교수'),
(102, '알고리즘',    3, '이교수'),
(103, '웹프로그래밍', 2, '박교수'),
(104, '운영체제',    3, '최교수');

INSERT INTO enrollment VALUES
(1, 1001, 101, 88.5,  '2026-03-02'),
(2, 1001, 102, 92.0,  '2026-03-02'),
(3, 1002, 101, 75.0,  '2026-03-02'),
(4, 1002, 103, 85.5,  '2026-03-02'),
(5, 1003, 102, 90.0,  '2026-03-02'),
(6, 1004, 101, 95.0,  '2026-03-02'),
(7, 1004, 104, 78.0,  '2026-03-02'),
(8, 1005, 103, NULL,  '2026-03-02');

-- 결과 확인
SELECT * FROM student;
SELECT * FROM subject;
SELECT * FROM enrollment;