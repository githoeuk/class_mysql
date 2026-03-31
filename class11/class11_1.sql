
-- DDL 

select * from product;

-- product 테이블에 is_deleted 컬럼을 추가 (소프트 삭제용)
alter table product add column is_deleted boolean default false;

select * from orders;

-- 인덱스 추가 
alter table orders add index idx_created_at(created_at);
show index from orders;

-- DML 

select * from member;
select * from member where grade = 'VIP';

select * from orders;
select * from orders where status = '배송중';

select * from product;
-- 재고가 50개 '미만'상품만 출력하기
select * from product where stock < 50; 

select * from product where category_id = 4;
select * from category;

-- update 연습(반드시 실수하지 말자)

-- '김영희' 등급을 GOLD로 변경
select * from member where name = '김영희';

update member
set grade = 'GOLD'
where name = '김영희';

-- 주문 상태 변경 (결제 대기 --> 결제 완료)
select * from orders where id = 6;
update orders
set status = '결제완료'
where id = 6;

-- 상품 재고 감소 (구매 시 처리되어야 함)
select * from product;
update product
set stock = stock-1
where id = 1;

-- 삼성 갤럭시 s24를 3.3%로 할인된 금액으로 수정 
select * from product;
update product
set price = price - ((price * 3.3)/100)
where id = 1;

-- delete ( 소프트 삭제 )
select * from product;
 
update product
set is_deleted = TRUE
where id = 1;


-- 삭제되지 않은 상품만 조회
select * from product where is_deleted = false;

--
select * from member; 
 
-- 유니크 키 추가 - 안되는 이유 확인 , 처리 - 중복 안됨
alter table member add constraint uk_email unique (email);
-- 또는 구문으로도 생성 가능 
alter table member add unique (email);
-- unique 제약 위반
insert into member (email, name) values ('hong@test.com','홍길동2');

select * from member;
-- fk 제약 위반
insert into orders(member_id,total_price) values (999,5000);

-- 도전문제

-- not null 위반 
insert into product(category_id, price, stock) values (1,500,10);

-- SELECT 도전
-- 1. 
select name, price from product where price between 100000 and 1500000;

-- 2.
select * from product where name like '삼성%' or '%삼성%' or '%삼성'; 

-- 3.
select name, email, grade from member where grade in ('VIP','GOLD');

-- 4.
select * from product;
select * from product order by price desc limit 3;

-- 5.
ALTER TABLE product ADD COLUMN is_deleted BOOLEAN DEFAULT FALSE; 
select name, stock, price from product where is_deleted = false and stock > 30 and price < 50000; 

-- update 도전

-- 6.
select * from product where category_id = 1; 
update product
set stock = stock + 10
where category_id = 1 and stock < 30;

-- 7.
select * from orders where status = '결제대기';
update orders 
set status = '결제완료'
where status = '결제대기';

-- 8.
select * from member where email  like 'hong%';
select * from member where email like 'lee%';
update member
set grade = 'GOLD'
where name in('홍길동','이철수');

-- 9. 
-- 재고가 0인 테스트 상품 3개 추가
INSERT INTO product (category_id, name, price, stock, description, is_deleted) VALUES
(2, '단종 청바지',   89000.00, 0, '재고 소진으로 판매 종료 예정', FALSE),
(3, '품절 과자 세트', 15000.00, 0, '일시 품절 상태',              FALSE),
(1, '구형 이어폰',   35000.00, 0, '신모델 출시로 재고 소진',      FALSE);

-- 추가 확인
SELECT name, stock, is_deleted FROM product WHERE stock = 0;

update product
set is_deleted = TRUE
where stock = 0;

-- 10.
select * from product where price > 40000 and category_id = 4;
update product 
set is_deleted = TRUE
where price > 40000 and category_id = 4;