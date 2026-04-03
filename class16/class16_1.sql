use sns;

-- group by 없이 전체 좋아요 개수 출력
select count(*) as '전체 좋아요 수'
from like_log;

select * from like_log;


-- group by 사용
-- 게시글 별 좋아요 수 
select post_id,count(*) as '좋아요 수'
from like_log 
group by post_id; -- 1. from절 먼저 실행 후 group by -> post_id로 그룹화 

-- group by와 집계 함수 모두 사용해보기 

select 
	post_id,
    count(*) as '좋아요 수',
    min(create_at) as '첫 번째 좋아요',
    max(create_at) as '마지막 좋아요'
from like_log
group by post_id
order by '좋아요 수' desc;

-- group by 사용 시 안되는 쿼리 
select * from post;

select user_id,title, count(*)
from post
group by user_id;

-- select위치에 title 컬럼을 집어넣으면 : 오류 발생 
-- grouop by가 title의 데이터 값 중 무엇을 출력해야하는지 판단불가

-- group by 사용 시 안되는 쿼리 
select * from post;

select id, count(*)
from post
where count(*) >= 3
group by id;

-- 오류 발생 : where 절에는 집계 함수 사용 불가 
-- where절은 그룹이 만들어지기 전에 실행이 됨 , 즉 아직 count 결과가 존재하지 않는 시점이라 사용이 불가.
-- group by에는 where 절 사용 불가 -> having절을 사용해야 한다.

select 
from
group by 
having