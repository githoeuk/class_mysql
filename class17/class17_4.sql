-- 각 도서별 통계 (group by 사용)

select * from student;
select * from book;
select * from borrow;
select * from review;

-- 자바 기초 책이 몇번 대출되었는가? (각 책에 대한 대출 횟 수, 대출 학생 수 출력)
-- 예) 자바 기초 책에 대한 총 대출 횟수 , 대출 학생 수 
-- 에) sql 완전정복 책에 대한 총 대출 횟수, 대출 학생 수 
-- 예) 파이썬 입문 책에 대한 총 대출 횟수, 대출 학생 수 

select
	b.title as 도서명,
    br.book_id as borrow_table_book_id,
    b.id as book_table_id
from book b
left join borrow br on b.id = br.book_id;

-- 추가적인 집계함수 사용하기  --> 총 대출 횟수 , 대출 학생 수 

select 
	b.title as 도서명,
    count(br.student_id) as '총 대출 횟수',
    count(br.student_id) as '대출 학생 수'
from book b
left join borrow br on b.id = br.book_id
group by b.id,b.title;

-- 만약  1번 학생이 1번책을 한번 더 대출했을 경우
-- insert into borrow(student_id,book_id) values (1,1);
-- delete from borrow where id = 8;

select 
	b.title as 도서명,
    count(br.student_id) as '총 대출 횟수',
    count(distinct br.student_id) as '대출 학생 수' -- 중복 방지 
from book b
left join borrow br on b.id = br.book_id
group by b.id,b.title;


-- 

insert into borrow (student_id,book_id) values (1,1);
select * from borrow;

