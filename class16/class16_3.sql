-- 실습 1 
-- 게시글 별 좋아요 수를 출력사이오 - 단, 좋아요가 없는 게시글도 출력이 되어야 합니다
-- 게시글 타이틀 , 좋아요 수 

select * from post;
select * from like_log;

select 
	p.title as 제목,
    count(l.id) as '좋아요 수'
from post p
left join like_log l on p.id= l.post_id
group by 제목,p.id;


select 
	p.id as 번호,
	p.title as 제목,
    count(l.id) as '좋아요 수'
from post p
left join like_log l on p.id = l.post_id
group by 번호,제목;

-- 실습 2
-- 사용자별 작성 게시글 수 출력 (게시글 하나도 작성 안한 회원도 나와야 함)
-- 닉네임, 작성글 수, 

select * from post;
select * from comment;
select * from user;

select 
	u.nickname as 닉네임,
    count(p.user_id) as '작성한 글'
from user u
left join post p on u.id = p.user_id
group by nickname;

-- 실습 3
-- 사용자별 평균 게시글 조회수 (단 2개 이상인 사람만)
-- 출력 결과물 : 닉네임, 게시글 수 , 평균 조회수 

select * from post;
select * from comment;
select * from user;

select 
	u.nickname as 닉네임,
    p.title as '게시글 제목',
    round(avg(p.view_count) )as '평균 조회수' 
from post p
join user u on p.user_id = u.id
group by nickname,title;
-- having count(p.user_id) >= 2;


select * from post;
select * from comment;
select * from user;

-- use sns;
select * from post;

select
	p.id,
	p.title,
    u.nickname,
    c.content
from comment c
join post p on c.post_id = p.id
join user u on c.user_id = u.id
-- where c.post_id = 5;