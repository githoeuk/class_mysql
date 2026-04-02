use shop;

start transaction;

-- 1. 주문 생성 
insert into orders (member_id,total_price,status)
values (1,1200000,'결제완료');

-- 2. 주문 상세 추가 
insert into order_item ( order_id, product_id, quantity,price)
values (10,1,1,1200000);

-- 3. 재고 감소
update product 
set stock = stock - 2
where id = 1;

-- 실패 처리 (기존에 수행되었던 커리를 다시 시작점으로 돌린다. = 물리적인 저장소에 반영 x ) 
rollback;

select * from orders;
select * from product;