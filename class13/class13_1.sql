-- JOIN 
-- 여러개로 나눠져있는 데이터를 합쳐 보는 방법 
--  inner , left join

use school;

select * from student;
select * from enrollment;
select * from subject;

-- INNER JOIN : 매칭되는 데이터만 
-- 두 테이블에 모두 매칭되는 행만 결합, 조건이 맞지 않으면 결과에서 제외

-- 학생 이름 + 수강 과목명 + 점수(enrollment) -> 한번에 결과 집합에 표현하고 싶음 
-- student subject enrollment 순으로 펼쳐서 해당하는 데이터만 뽑는다

-- select e.student_id, e.score
select 
	s.name as 학생이름,
    su.subject_name as 과목명,
	e.score
from enrollment as e
inner join student as s ON e.student_id = s.student_id -- 조건 : enrollment와 student의 syudent_id가 동일한 값과 컬럼만 출력 
inner join subject as su ON e.subject_id = su.subject_id; -- 위 조건을 포함한 뒤 
 
 -- 1. enrollment 기준으로 먼저 조건 확인 -> 2. student 기준으로 조건 확인 -> 3. subject기준으로 조건 확인.

select * from student;

insert into student(student_id,name,grade,major) values
(10,'tomo',3,'jungle');

-- LEGT JOIN ( 왼쪽 테이블 전체 포함)
-- 왼쪽 테이블의 모든 행을 전부 포함
-- 오른쪽 테이블에 매칭 테이블이 없으면 NULL로 채운다.

-- 조건 : 모든 학생 조회 + 수강 기록 없는 학생 포함 , 과목명도 포함 
select 
	s.name as 학생이름,
    su.subject_name as 과목명,
    e.score as 점수
from student s
left join enrollment e on s.student_id = e.student_id
left join subject su on e.subject_id = su.subject_id;

-- right join : 오른쪽 테이블 기준으로 모든 행을 포함

select 
	s.name as 학생이름,
    su.subject_name as 과목명,
    e.score as 점수
from student s 
right join enrollment e ON s.student_id = e.student_id -- student -> enrollment 
right join subject su ON e.subject_id = su.subject_id; -- ( student -> enrollment ) -> subject 
-- 순서로 오른쪽으로 밀어가며 right join을 실행하면 기준이 되는 subject 의 모든 행이 보존된다.

insert into subject(subject_id, subject_name, credit , professor) values
(105,'과학',3,'정교수');

-- 위 right join 쿼리와 동일한 결과를 left join으로 표현해보자.

select 
	s.name as 학생이름,
    su.subject_name as 과목명,
    e.score as 점수
from subject su
left join enrollment e ON su.subject_id = e.subject_id
left join student s ON e.student_id = s.student_id;

-- subject를 기준(왼쪽)에 두고 LEFT JOIB 으로 연결하는 것이 더 직관적이다.
-- RIGHT JOIN은 기준 테이블 오른쪽에 있어 가독성이 떨어지므로 
-- 실무에서는 LEFT JOIN으로 방향을 통일하는 것을 권장한다.