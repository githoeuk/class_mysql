use school;

-- 특정 컬럼만 조회 
SELECT name, major FROM student;

-- WHERE 절 추가
SELECT * FROM student WHERE name = '김철수';

-- 별칭 (AS) 사용 -- student_id의 이름을 '학번'으로 표현 
SELECT student_id as 학번, name as 이름 from student;

-- mysql에서도 연산자를 사용할 수 있다.

SELECT * FROM student WHERE NOT name = '김철수';

-- 특수연산자 
-- between , between a and b -- a에서 b까지의 범위
SELECT * FROM student WHERE grade BETWEEN 1 and 2;

-- in(값1, 값2) -- 포함되어 있는 내용 출력
SELECT * FROM student WHERE name in('이영희','최지아','티모'); -- '해당하는 값이 없어도 오류 x)

-- LIKE
SELECT * FROM student WHERE name LIKE '김%'; -- '김'으롷 시작하는 모든 이름을 테이블에서 뽑아냄 
SELECT * FROM student WHERE major LIKE '%학'; -- ㅡmajor에서 '학'으로 끝나는 모든 내용 출력
SELECT * FROM student WHERE major LIKE '%퓨%'; -- major에서 중간에 '퓨'가 들어가는 내용 출력

-- null : 컬럼에 null값을 찾을 때는 '='연산자 사용 불가 
SELECT * FROM student WHERE phone IS NULL; -- null값을 찾고 싶을 땐 IS NULL 사용 
SELECT * FROM student WHERE phone IS NOT NULL; -- NULL이 아닌 값을 찾을때는 IS NOT NULL 사용alter

 