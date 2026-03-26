-- 테이블 삭제 방법 주석으로 안전장치 처리! 
-- drop table student;
-- drop table subject;
-- drop table enrollment;

-- 학생 데이터
INSERT INTO student (student_id, name, grade, major, phone) VALUES
(1001, '김철수', 2, '컴퓨터공학', '010-1234-5678'),
(1002, '이영희', 3, '경영학',     '010-2345-6789'),
(1003, '박민준', 1, '전자공학',   '010-3456-7890'),
(1004, '최지아', 4, '컴퓨터공학', '010-4567-8901'),
(1005, '한수연', 2, '경영학',     NULL);

-- 과목 데이터
INSERT INTO subject (subject_id, subject_name, credit, professor) VALUES
(101, '데이터베이스', 3, '김교수'),
(102, '알고리즘',    3, '이교수'),
(103, '웹프로그래밍', 2, '박교수'),
(104, '운영체제',    3, '최교수');

-- 수강 데이터
INSERT INTO enrollment (enrollment_id, student_id, subject_id, score, enrolled_at) VALUES
(1, 1001, 101, 88.5,  '2026-03-02'),
(2, 1001, 102, 92.0,  '2026-03-02'),
(3, 1002, 101, 75.0,  '2024-03-02'),
(4, 1002, 103, 85.5,  '2024-03-02'),
(5, 1003, 102, 90.0,  '2024-03-02'),
(6, 1004, 101, 95.0,  '2024-03-02'),
(7, 1004, 104, 78.0,  '2024-03-02'),
(8, 1005, 103, NULL,  '2024-03-02');

-- 데이터 확인
SELECT * FROM student;
SELECT * FROM subject;
SELECT * FROM enrollment;

-- 쪼개서 사용 가능 
select * 
from enrollment
where student_id = 1001;

SELECT * FROM SUBJECT WHERE SUBJECT_ID = 101;
SELECT * FROM SUBJECT WHERE SUBJECT_ID = 102;

