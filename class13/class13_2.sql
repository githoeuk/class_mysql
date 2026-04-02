use shop;

select * from member;
select * from product;
select * from orders;

-- 조건 : 주문한 회원을 ( 회원 이름 + 주문 정보 )로 출력 
-- inner join 사용해야 함 
-- 기준 테이블이 무관할때는 작은 양에 데이터를 가지고 있는 이테이블 기준으로 하는 것이 관례 

select 
	m.name as 회원명,
    o.id as 주문번호,
    o.total_price as 주문금액,
    o.status as 주문상태
from orders o
inner join member m ON o.member_id = m.id; 

-- 2. 모든 회원 + 주문 정보(주문 없는 회원도 포함)
-- 모든 회원출력 -> leff join

select m.*,o.ststus
from member m
left join orders o ON m.id = o.member_id;

-- 3. 주문 상세 : 주문번호 + 상품명 + 수량 + 가격 + 회원명 
-- 주문 상세 기준 = orders

select * from order_item;
select * from orders;
select * from product;
select * from member;

select 
	m.name as 회원명,
    oi.id as 주문번호,
    o.total_price as 주문번호,
    o.status as 주문 상태
from order_item oi
inner join orders o ON oi.order_id = o.id
inner join product p ON oi.product_id = p.id
inner join member m ON o.member_id = m.id;

-- 카테고리별 상품 전체 목록 출력 - tb : 카테고리 , 제품
select * from product;
select * from category;

select 
	c.name as 카테고리,
    p.name as 상품명,
    p.price as 가격,
    p.stock as 재고
from category c
inner join product p ON c.id = p.category_id
order by c.name, p.price desc 
limit 5;

use school;
-- ON없이 join 시 모든 행에 조합이 나온다 

select * from student;
select * from enrollment;


select *
from student
join enrollment;