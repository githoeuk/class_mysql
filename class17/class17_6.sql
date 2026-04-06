use shop;

-- 1페이지에서 5건 보여줌
select * from product order by id limit 5 offset 0;
-- 2페이지에 5건을 보여줘야 함 -> 5번 건너뜀
select * from product order by id limit 5 offset 5;
-- 3페이지 - 5건 보여줘야 함 
-- 페이지 당 5번 건너뜀 - 3페이지면 -> 10번 , 4페이면 -> 15 ...
-- select * from product order by id limit 5 offset 10;

select * from product;

SELECT * FROM product where price between '10000' and '100000'	
order by price asc;

use shop2;

select * from product2;

update product2
set price = 1
where name = '테스트1';

delete from product2 where id = 1;