-- DML (데이터를 다룬다 - 조작)

SELECT * FROM student;

-- 데이터 추가 (INSERT)
INSERT INTO student(student_id ,name ,grade , major , phone)
VALUES(1001 ,'김철수',2 ,'컴퓨터공학' ,'010-1234-1234');
      
INSERT INTO student(student_id ,name ,grade , major , phone)
VALUES(1002 ,'이영희',2 ,'경영학' ,'010-4801-4801'),
	  (1003 ,'박민준',2 ,'전자공학' ,'010-9790-9790');
      
-- 데이터 조회 (SELECT)
SELECT * FROM student;
-- 조건절 추가 하기 (필터링)
SELECT name ,major , grade FROM student WHERE grade = 2;

-- 데이터 수정(UPDATE) -- 주의 -- !조건절이 없으면 전체 수정!
UPDATE student SET grade = 2 WHERE student_id = 1001; 
UPDATE student SET grade = 3 WHERE student_id = 1002; 
UPDATE student SET grade = 1 WHERE student_id = 1003;


-- 데이터 삭제 (DELETE)-- 주의 -- !조건절이 없으면 전체 수정!
DELETE FROM student where student_id = 1003;
DELETE FROM student;