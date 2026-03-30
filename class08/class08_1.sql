use school;

select * from student where student_id = 1001;

update student set grade = 3 where student_id = 1001;

-- 여러 컬럼 동시 수정(컬럼명 = 값 , 컬럼명 = 값..)
-- 1004 학번에 grade - 3 , phone = 010-7777-7777

update student 
set grade = 3, phone = '010-7777-7777'
where student_id = 1004;

-- 수강 테이블 
select * from enrollment;
select * from subject;

-- 수강 철회 -> 수강 테이블에서 과목 삭제 처리
delete from enrollment where enrollment_id = 8;

delete from enrollment where student_id = 1004;
select * from student;

-- 경영학 학생들 학년 수정 
select * from student where major = '경영학';
update student set grade = grade - 1 where major = '경영학';

