
-- 예제 1번
-- 좋아요가 2개 이상인 게시글만 조회 

select * from like_log; 

select 
	post_id,
    count(*) as '좋아요 수'
from like_log
group by post_id
having count(*) >= 2;

-- 에제 2번
-- where 와 having은 역할이 달라서 한 쿼리에 같이 사용이 가능하다.
-- 조회수 120이상인 게시글 중 좋아요 2개 이상인 게시글만 출력하시오
-- 게시글 title + 좋아요 수 

select * from post;
select * from like_log;

select 
	p.title,
    count(l.id) as '좋아요 수'
from post p
join like_log l on p.id = l.post_id
where p.view_count >= 120
group by p.id,p.title
having count(l.id) >= 2
order by '좋아요 수' desc;

-- where 절 조회수 120 이상인 게시글만 먼저 추림
-- 남은 게시글로 group by 실행 
-- having으로 좋아요 2개이상 그룹만 추출
