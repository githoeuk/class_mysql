-- 쇼핑몰

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

-- 회원 테이블 일반, VIP 
CREATE TABLE member(

	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(20), 
    grade VARCHAR(10) DEFAULT '일반', -- 일반을 기본값으로 설정 
    created_at DATETIME DEFAULT current_timestamp -- 자동으로 현재 시간 저장 
); 

SELECT * FROM member;

-- 상품 카테고리 테이블 
CREATE TABLE category(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

SELECT * FROM category;

-- 상품 테이블
CREATE TABLE product(
	
	id int PRIMARY KEY AUTO_INCREMENT,
    category_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    foreign key(category_id) references category(id)
);

SELECT * FROM product;

-- 주문 테이블 : 테이블 명에 예약어를 사용할려면 백틱(`)으로 감싸줘야 한다.
CREATE TABLE orders(

	id INT PRIMARY KEY AUTO_INCREMENT,
	member_id BIGINT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT '결제대기',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	foreign key(member_id) references member(id)
); 

SELECT * FROM orders;

-- 주문 상세테이블 - 주문 1건에 여러 상품이 나오기 때문이다 
CREATE TABLE order_item(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
	
    foreign key (order_id) references orders(id),
    foreign key (product_id) references product(id)

);

show tables; -- 테이블 전부 보여줌