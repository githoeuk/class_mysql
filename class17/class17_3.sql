-- 2단계 ㅣ count와 count(Distinct)

select * from student;
select * from book;
select * from borrow;
select * from review;

-- 상황 : 전체 대출 정보 출력(학생 id, 학생이름, 책id, 책이름)
select 
	bw.id,
	student_id as '학번',
	s.name as '학생 이름',
    book_id as '책번호',
    b.title as '책 제목'
from borrow bw
left join book b on bw.book_id = b.id
left join student s on bw.student_id = s.id
order by s.name asc;

-- 전체 대출이 일어난 횟수 알려주세요 
select count(*) as '총 대출 횟수' from borrow;

-- 대출한 학생 수만 확인하고 싶다면 ( 한 학생이 여러번 대출 가능하다) - count(distinct)
select count(distinct student_id) as '대출 학생 수' from borrow;

-- distinct는 문법적으로 select 절 바로 앞에만 사용이 가능하다.
-- 단 count함수 안에서는 distinct를 사용할 수 있다. (뭉쳐진 바구니 안에 중복된 데이터는 제거하고 카운트한다.)

-- 대출 테이블에서 총 대출 횟수 정보, 대출 학생 수를 각각 출력하시오.alter
select count(*) as '총 대출 횟수', 
		count(distinct student_id) as '대출 학생 수' 
from borrow;



