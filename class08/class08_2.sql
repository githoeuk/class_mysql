CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;

CREATE TABLE product (
    product_id  INT           PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(100)  NOT NULL,
    category    VARCHAR(30)   NOT NULL,
    price       DECIMAL(10,2) NOT NULL,
    stock       INT           DEFAULT 0,
    is_sale     BOOLEAN       DEFAULT FALSE
);

INSERT INTO product (name, category, price, stock, is_sale) VALUES
('삼성 갤럭시 S24',  '휴대폰',    1200000, 50,  FALSE),
('애플 아이폰 15',  '휴대폰',    1500000, 30,  FALSE),
('자바 완전정복',    '도서',       32000,   100, FALSE),
('나이키 티셔츠',    '의류',       59000,   200, TRUE),
('삼성 노트북',   '노트북',   1300000, 20,  FALSE),
('요가 매트',        '운동',       45000,   150, TRUE),
('마우스 로지텍',  '주변기기',  89000,   80,  FALSE),
('파이썬 기초',       '도서',       25000,   300, FALSE);

-- 1
select * from product where product_id = 1;
update product set price = 1100000  where product_id = 1;

-- 2
select * from product where category = '도서';
update product set is_sale = TRUE where category = '도서';

-- 3
select * from product where product_id = 6;
delete from product where product_id = 6;

-- 4 
-- 테스트 데이터 추가
INSERT INTO product (name, category, price, stock)
VALUES ('포스트졸 쓰레드 3', '논멀피터 ', 150000, 0);

select * from product where stock = 0;
delete from product where stock = 0;

-- 5
update product set price = price * 1.9 where category = '휴대폰';

