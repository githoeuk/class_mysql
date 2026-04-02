

select * from member;
select * from product;
select * from orders;
select * from order_item;

-- 
start transaction;

-- 주문 생성 
insert into orders(member_id,total_price,status) 
values (2,1300000.00 * 2,'결제완료');

--  주문 상세 생성 
insert into order_item(order_id,product_id,quantity,price)
value (2,3,2, 1300000.00 * 2);
-- value (last_insert_id(),3,2, 1300000.00 * 2);

select last_insert_id();

-- 재고 감소
update product
set stock = stock - 2
where id = 3;

--
commit;