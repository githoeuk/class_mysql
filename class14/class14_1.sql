-- 별칭(Alias)
-- 컬럼명이나 테이블명에 별칭을 붙여서 결과를 읽기 쉽게 만든다.

use school;

select * from student;

select 
	student_id as 학번,
    name		as 이름
from student;

-- as 생략 가능 
select student_id 학번 , name 이름 from student;

select s.student_id 학번 , s.name 이름 from student s;

use shop;
-- 계산 결과에도 별칭 사용 
select 
	name,
    price,
    price * 0.9 as 할인가격 -- (3.3%할인 - 0.967)
from product;
