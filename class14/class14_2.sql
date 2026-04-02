use shop;

-- 주문 처리 시 동시에 일어나야 하는 작업 
-- 1. orders 테이블에 주문 추가 -> insert
-- 2. order_item 테이블에 주문 상세 추가-> insert
-- 3. product 테이블에 재고(stock) 감소 처리 -> update

select * from orders;
select * from product;
select * from order_item;

-- 트랜잭션 시작
start transaction;

-- 1. 주문 생성
insert into orders(member_id,total_price,status) values
(1,1200000.00,'결제완료');

-- 2. 주문 상세 추가 
-- 2.1방금 생성된 주문의 id 확인 
select last_insert_id();

insert into order_item(order_id,product_id,quantity,price) values
(8,1,1,1200000.00);

-- 3. 재고 감소
update product
set stock = stock - 1
where id = 1;

-- 모두 성공 시 ( 물리적인 저장소에 영구 저장)
commit;

-- 트랜잭션 종료 (commit or rollback)