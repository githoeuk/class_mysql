use sns;

-- 전체 게시글 수 출력하기 
select * from post;
select count(*) as 게시글_수 from post;
select count(id) as 게시글_수 from post;

select * from like_log;
select count(*) as 총_좋아요_수 from like_log;

-- 평균조회수 
select (view_count) as 평균조회수 from post;
select round(avg(view_count),2) as 평균조회수 from post;

-- 최대 / 최소 
select view_count from post;
select max(view_count) from post;
select min(view_count) from post;

-- 한번의 쿼리에 최대 / 최소 조회수를 출력해보자 
select max(view_count) as 최대조회수,min(view_count) as 최소조회수 
from post;

-- 문자열 함수 
-- concat , upper , lower

select nickname from user;
-- select nickname + ('a@email.com') from user;
select concat(nickname,'(',email,')') as 회원정보 from user;

-- upper , lower
select upper(email) as 대문자이메일 from user;
select lower(email) as 소문자이메일 from user;

-- substring, locate
select '안녕 반가워';
-- mysql에서 글자 순번은 서수적 표현을 사용한다. 
-- 서수적 표현 = 0이아닌 1부터 시작하는 표현방법
-- locate(찾을 문자, 원본 문자열) : 특정 문자가 시작되는 '위치'를 숫자로 반환한다. 
select locate('@','abc@com'); 

-- substring(원본 문자열,시작 위치, 가져올 길이) : 원본 문자열에서 정해진 범위만큼 잘라낸다.
select substring('abc@com',1,4);
select substring('abc@com',0,4);

-- 응용 chulsoo.kim@gmail.com -> chulsoo.kim
select * from user;
select substring(email,1,locate('@',email) -1 ) as subemail from user ;

-- length , char_length

-- length 주의사항 : 문자열의 바이트 수를 반환한다.(mysql 한글처리 : utf8로 글자당 3바이트)
select 'hi',length('hi') as 글자길이;
select '자바',length('자바') as 글자길이;

-- char_length : 문자열에 글자 수 반환.(한글 사용시 권장)
select 'hi',char_length('hi') as 글자길이;
select '자바',char_length('자바') as 글자길이;

-- 조건 함수 
-- 조회수에 따라 인기 등급 표시 
select taile,view_count from post;
-- 50보다 크다 : 인기글 , 30보다 크거나 같다 : 주목길

 select 
 title,
 view_count,
 case
	when view_count >= 50 then '인기글'
    when view_count < 30 then '주목글'
	else '일반글'
end as 인기등급
from post
order by view_count desc;

-- 날짜 함수 

-- 오늘 날짜 
select curdate() as 오늘;
select current_date as 오늘;

-- datediff : 날짜 차이 계산
-- 가입 후 경과 일 수 
select * from user;

select nickname,create_at,datediff(current_Date,'2025-04-02') as 가입일수
from user;

-- 가입 년도 / 월 추출
select nickname, year(create_at) as 가입년도 , month(create_at) as '가입 월' from user;


-- 형 변환 함수 
-- Mysql에서 varchar는 변환 불가 - 동적 메모리 사용하기 때문 / char는 변환가능 
select 
	title,
    concat(view_count , '회') as '조회 수' -- 형 변환이 해줘야 하는데 지금은 자동으로 해준다...
from post;

select 
	title,
    concat(cast(view_count as char) , ' 회') as '조회 수' 
from post;

select title,view_count,nickname,content
from
