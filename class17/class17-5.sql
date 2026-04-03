-- 4단계 행 곱셈 문제 
-- 서로 아무 관련 없는 두 테이블을 부모 테이블이 같다고 해서
-- 억지로 join 시키면 경우의 수(데이터 뻥튀기)현상이 발생한다.

-- 도서별 대출 수와 리뷰 수를 한번에 조회하고 싶다.
select * from borrow where book_id = 1;
select * from review where book_id = 1;

-- 대출과 리뷰 테이블 연결고리가 없음
-- 단지 book_id의 부모테이블이 동일할 뿐

-- 두 테이블을 동시에 join하게되면 어떻게 되는가?
select 
	b.title as 도서명
from book b
left join borrow br on b.id = br.book_id
left join review rv on b.id = rv.book_id;

-- 위의 커리에서 일어난 일 
-- 대출이랑 리뷰테이블은 아무 연결고리가 없는데 
-- 누가 1번의 짝인지 모르니 그냥 1번 책에서 나온 기록끼리의 모든 조합들 짝을 지어줌
-- 3 * 3 = 9행 발생 --> 행 곱셈문제 발생 

-- 데이터 뻥튀기 된 이후 집계함수(count) 사용
select 
	b.title as 도서명,
    count(distinct br.id)as 대출수,
    count(distinct rv.id)as 리뷰수
from book b
left join borrow br on b.id = br.book_id
left join review rv on b.id = rv.book_id
group by b.id, b.title