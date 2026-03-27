-- 실습용 DB 생성
CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;

-- 도서 테이블
CREATE TABLE book (
    book_id    INT          PRIMARY KEY AUTO_INCREMENT,
    title      VARCHAR(100) NOT NULL,
    author     VARCHAR(50)  NOT NULL,
    price      DECIMAL(10,2) NOT NULL,
    stock      INT          DEFAULT 0,
    published_at DATE,
    created_at DATETIME     DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE book AUTO_INCREMENT=1;
SET @COUNT = 0;
UPDATE book SET book_id = @COUNT:=@COUNT+1;


select * from book;

insert into book(title,author,price,stock)values
('자바 완전 정복','김자바',32000,50);

insert into book(title,author,price,stock)values
('MySQL 입문','이디비','28000','30'),
('스프링 부트 실전','박스트링','35000','20'),
('파이썬 기초','최파이','25000','100');

-- 회원 테이블
CREATE TABLE customer (
    customer_id INT          PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(50)  NOT NULL,
    email       VARCHAR(100) NOT NULL,
    phone       VARCHAR(20),
    grade       VARCHAR(10)  DEFAULT '일반'
);

ALTER TABLE customer AUTO_INCREMENT=1;
SET @COUNT = 0;
UPDATE customer SET customer_id = @COUNT:=@COUNT+1;

insert into customer(name,email) values
	('홍길동','hong@test.com'),
	('김영희','kim@test.com');
    
select * from customer;

-- 구매 테이블
CREATE TABLE purchase (
    purchase_id  INT  PRIMARY KEY AUTO_INCREMENT,
    customer_id  INT  NOT NULL,
    book_id      INT  NOT NULL,
    quantity     INT  NOT NULL,
    total_price  DECIMAL(10,2) NOT NULL,
    purchased_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (book_id)     REFERENCES book(book_id)
);

ALTER TABLE purchase AUTO_INCREMENT=1;
SET @COUNT = 0;
UPDATE purchase SET purchase_id = @COUNT:=@COUNT+1;

select * from purchase;

insert into purchase(customer_id, book_id, quantity, total_price) 
	values(1, 1, 2, 32000.00 * quantity);
    
-- 오류가 발생하는 쿼리
INSERT INTO purchase (customer_id, book_id, quantity, total_price)
VALUES (1, 1, 1, 32000.00);
-- customer_id에서 999번은 아직 존재하지 않음 

-- delete from book;
-- delete from customer;
-- delete from purchase;