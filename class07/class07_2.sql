

use school;

-- 2학년 학생들 조회
select * from student where grade = 2;

-- 컴퓨터공학 전공 학생 조회 
select student_id as '학번',name as '이름' 
from student 
where major = '컴퓨터공학';

-- 전화번호가 없는 학생 조회 
select * from student where phone is null;

-- ----------------------------------------
select * from enrollment;

-- 점수가 90점 이상인 수강 기록을 찾으시오
select * from enrollment where score >= 90;

-- 점수가 80점에서 90점 사이인 학생들을 출력하시오 
select * from enrollment where score between 80 and 90;

-- 78.00 , 95.00 인 학생을 찾으시오
select * from enrollment where score in(78.00,95.00);

