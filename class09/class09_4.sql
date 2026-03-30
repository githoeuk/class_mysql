CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;

-- 저자 테이블 (PK + UNIQUE)
CREATE TABLE author (
    author_id  INT          PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(50)  NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    phone      VARCHAR(20)  UNIQUE
);

-- 도서 테이블 (PK + FK)
CREATE TABLE book (
    book_id    INT           PRIMARY KEY AUTO_INCREMENT,
    title      VARCHAR(100)  NOT NULL,
    author_id  INT           NOT NULL,
    price      DECIMAL(10,2) NOT NULL,
    isbn       VARCHAR(20)   UNIQUE,
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- 저자 데이터 입력
INSERT INTO author (name, email, phone) VALUES
('김자바',   'java@test.com',   '010-1111-1111'),
('이디비',   'db@test.com',     '010-2222-2222'),
('박스프링', 'spring@test.com', '010-3333-3333');

-- 도서 데이터 입력
INSERT INTO book (title, author_id, price, isbn) VALUES
('자바 완전정복',1, 32000, 'ISBN-001'),
('MySQL 입문',2, 28000, 'ISBN-002'),
('스프링 부트 실전',3, 35000, 'ISBN-003'),
('자바 심화학습',1, 29000, 'ISBN-004');

select * from author;
select * from book;
-- 1 
insert into author (name, email ,phone) values
('정테스트','java@test.com', '010-9999-9999');
-- 이메일이 unique값이라서 중복 불가 

-- 2
INSERT INTO book (title, author_id, price, isbn)
VALUES ('신규 도서', 999, 20000, 'ISBN-005');
-- pk키인 author테이블의 author_id에는 999번이 존재하지 않기 때문
-- author 테이블을 먼저 수정한 뒤에 추가가 가능하다.

-- 3
-- 시도 1: 중복 ISBN 입력
INSERT INTO book (title, author_id, price, isbn)
VALUES ('또 다른 책', 1, 15000, 'ISBN-001');
-- isbn은 unique 값이라 동일 값 입력 불가 
-- 시도 2: isbn 에 NULL 입력
INSERT INTO book (title, author_id, price, isbn)
VALUES ('염리는 책', 2, 18000, NULL);
-- unique는 null 허용하지 않음 

-- 4

-- fk제약 위반 오류 발생 

-- show create table ;

select * from author;
select * from book;

alter table book drop foreign key book_ibfk_1;

alter table book add constraint fk_book_author_id
foreign key book references author(author_id) 
on delete cascade on update cascade;

alter table author drop author_id;
delete from author where author;
-- 해결 방법 : 걍 자식테이블 먼저 삭제


-- 5 
create table review(
	reivew_id int PRIMARY KEY AUTO_INCREMENT,
    book_id int not null,
    author_id int not null,
    rating int not null,
    content text not null,
    create_at datetime default current_timestamp,
    foreign key (book_id) references book(book_id),
    foreign key (author_id) references author(author_id)
    );
    