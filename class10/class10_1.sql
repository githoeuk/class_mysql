create database demo2;
use demo2;

-- table 생성 시 인덱스를 추가하는 방법 
create table product(
	id int primary key auto_increment, -- primary key는 자덩으로 인덱스에 저장되어있음
    category_id int not null,
    name varchar(100) not null,
    price decimal(10,2) not null,
    stock int default 0,
    index idx_category(category_id),
    index idx_name(name)
    );
    
select * from product;
desc product;

-- 테이블 생성 이후에 인덱스를 추가하는 방법 ( price -> index에 추가)
-- alter - 추가 생성 
alter table product add index idx_price(price);

-- 또는 create를 사용해도 됨
create index idx_price on product(price);

-- 인덱스를 확인하는 방법 
show index from product;

-- 인덱스 삭제하는 방법 (price 인덱스 삭제)
drop index idx_price on product;


