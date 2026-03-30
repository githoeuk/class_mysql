
-- shop db사용
use shop;
show tables;

-- 쇼핑몰 
drop database if exists shop;
create database shop;
use shop;

-- 회원 테이블  일반, VIP
create table member(
	id bigint primary key auto_increment,
    email varchar(100) not null unique, 
    name varchar(50) not null, 
    phone varchar(20),
    grade varchar(10) default '일반', 
    created_at datetime  default current_timestamp
);
select * from member;

-- 상품 카테고리 테이블 
create table category(
	id int primary key auto_increment, 
    name varchar(50) not null
);

select * from category;

-- 상품 테이블 
create table product(
	id int primary key auto_increment, 
    category_id int not null, 
    name varchar(100) not null, 
    price decimal(10, 2) not null, 
    stock int default 0, 
    description text, 
    created_at datetime default current_timestamp,
    foreign key(category_id) references category(id)
);

-- 주문 테이블  : 테이블 명에 예약어 사용하려면 백틱(`) 으로 감싸줘야 한다. 
create table orders (
	id int primary key auto_increment, 
    member_id bigint not null, 
    total_price decimal(10, 2) not null, 
    status varchar(20) default '결제대기',
    created_at datetime default current_timestamp, 
    foreign key (member_id) references member(id)
);

select * from orders; 

-- 주문 상세 테이블 (주문 1건에 여러 상품)
create table order_item(
	id int primary key auto_increment, 
    order_id int not null, 
    product_id int not null, 
    quantity int not null, 
    price decimal(10, 2) not null, 
    foreign key (order_id) references orders(id), 
    foreign key (product_id) references product(id)
);

show tables;